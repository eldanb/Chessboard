#include "BoardControls.h"

//
// 74HC595 --->
// 

#define PIN_SHIFT_CLK 17
#define PIN_SRC_CLK 16
#define PIN_SINK_CLK 4
#define PIN_DS 0

#define PIN_SWITCH_SH_LD 32
#define PIN_SWITCH_CLK 33
#define PIN_SWITCH_DATA 34
#define PIN_SWITCH_ROW_CP 27

Event e;

BoardControls::BoardControls() : 
    _queue(NULL) {
  memset(_ledRows, 0, sizeof(_ledRows));
  memset(_lastButtonState, 0, 8*9*sizeof(bool));
  memset(_stickyButtonState, 0, 8*9*sizeof(bool));
  memset(_pendingButtonChangeStartTime, 0, sizeof(_pendingButtonChangeStartTime));
}

void BoardControls::setLedState(int row, int col, int state) {
  _ledRows[row] &= ~(0x0101 << (7-col));

  switch(state) {
    case BOARD_LED_STATE_OFF:
      break;
      
    case BOARD_LED_STATE_GREEN:
      _ledRows[row] |= (0x0100 << (7-col)); 
      break;
      
    case BOARD_LED_STATE_RED:
      _ledRows[row] |= (0x0001 << (7-col));
      break;

    case BOARD_LED_STATE_BLINK:
      _ledRows[row] |= (0x0101 << (7-col));
      break;
  }
}

void BoardControls::setLedRows(int ledRows[8]) {
  memcpy(_ledRows, ledRows, sizeof(_ledRows));
}

void BoardControls::clearLeds() {
  memset(_ledRows, 0, sizeof(_ledRows));  
}


bool BoardControls::getButtonDown(int row, int col) {
  return _stickyButtonState[row][col];
}

void BoardControls::readSwitches() {
   int currentMillis = millis();
   
   setLedSinks(0);

   for(int r=0; r<9; r++) {
      setRowSource(r);
      if(r == 8) {
         digitalWrite(PIN_SWITCH_ROW_CP, 1);
         delayMicroseconds(10);
      }

      // Read all switch columns
      delayMicroseconds(50);
      digitalWrite(PIN_SWITCH_SH_LD, 0);
      delayMicroseconds(10);
      digitalWrite(PIN_SWITCH_SH_LD, 1);
      delayMicroseconds(5);

      // Clear sources
      setRowSource(8);
      digitalWrite(PIN_SWITCH_ROW_CP, 0);

      // Read serial buffer
      for (int d = 7; d >= 0; d--) {
        delayMicroseconds(3);

        int cswitch = digitalRead(PIN_SWITCH_DATA);
        digitalWrite(PIN_SWITCH_CLK, 0);
        delayMicroseconds(3);
        digitalWrite(PIN_SWITCH_CLK, 1);

        if (_lastButtonState[r][d] != cswitch) {
          _pendingButtonChangeStartTime[r][d] = currentMillis;
          _lastButtonState[r][d] = cswitch;
        } else {
          if(_pendingButtonChangeStartTime[r][d] &&
             _pendingButtonChangeStartTime[r][d] + 10 < currentMillis) {
             _stickyButtonState[r][d] = _lastButtonState[r][d]; 
  
             e.evtType = _stickyButtonState[r][d] ? EventType::evtTypeKeyDown : EventType::evtTypeKeyUp;
             e.arg1 = r;
             e.arg2 = d;
                        
             _queue->postEvent(e);    
             _pendingButtonChangeStartTime[r][d] = 0;
          }
        }
      }
   }
}

void BoardControls::setLedSinks(int s) {    
    for (int c = 15; c >= 0; c--) {
      digitalWrite(PIN_SHIFT_CLK, 0);

      int pd = 1;
      if((s >> c) & 0x01) {
        if( ((s >> (c & 0x7)) & 0x0101) == 0x0101) {
          pd = (millis() / 250)%2;
        } else 
        {
          pd = 0;
        }
      }
      
      digitalWrite(PIN_DS, pd);
      digitalWrite(PIN_SHIFT_CLK, 1);
    }
    digitalWrite(PIN_SHIFT_CLK, 0);
    digitalWrite(PIN_SINK_CLK, 0);
    digitalWrite(PIN_SINK_CLK, 1);
}

void BoardControls::setRowSource(int r) {
  // Load row to source
  for (int rb = 0; rb < 8; rb++) {
    digitalWrite(PIN_SHIFT_CLK, 0);
    delayMicroseconds(2);
    digitalWrite(PIN_DS, rb == r ? 1 : 0);
    delayMicroseconds(2);
    digitalWrite(PIN_SHIFT_CLK, 1);
    delayMicroseconds(2);
  }
  digitalWrite(PIN_SRC_CLK, 0);
  delayMicroseconds(10);
  digitalWrite(PIN_SRC_CLK, 1);
  delayMicroseconds(10);
  digitalWrite(PIN_SRC_CLK, 0);
}

void BoardControls::onLoop() {
  // Scan rows
  for (int r = 0; r < 8; r++) {
    setLedSinks(0);
    setRowSource(r);    
    setLedSinks(_ledRows[r]);

    delayMicroseconds(800);
  }

  readSwitches();
}
    
void BoardControls::onAddedToQueue(EventQueue *queue) {
  pinMode(PIN_SHIFT_CLK, OUTPUT);
  pinMode(PIN_SRC_CLK, OUTPUT);
  pinMode(PIN_SINK_CLK, OUTPUT);
  pinMode(PIN_DS, OUTPUT);

  pinMode(PIN_SWITCH_SH_LD, OUTPUT);
  pinMode(PIN_SWITCH_CLK, OUTPUT);
  pinMode(PIN_SWITCH_DATA, INPUT);
  pinMode(PIN_SWITCH_ROW_CP, OUTPUT);
  digitalWrite(PIN_SWITCH_ROW_CP, 0);   


  _queue = queue;
}
