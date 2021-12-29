#include "Wire.h"


#include "EventQueue.h"
#include "EventQueueTimer.h"
#include "BoardControls.h"
#include "oled_resources.h"

#include "Board.h"

#include "MmiState.h"
#include "MmiStateMenu.h"
#include "MmiStateForm.h"
#include "MmiStateBoardReview.h"
#include "MmiStateCustomBoard.h"
#include "MmiStateGameTurn.h"
#include "MmiStateHwTest.h"
#include "MmiStateMainMenu.h"
#include "MmiStateGameEnd.h"
#include "MmiStateGameSettings.h"


//#define ENABLE_EVENT_LOGGING

#define DISPLAY_OLED_I2C_ADDRESS (0x78>>1)

BoardControls board;
MmiStateReference currentMmiState;

#ifdef ENABLE_EVENT_LOGGING
class EventLogger : public aui::EventListener {  
  public:
  void dispatchEvent(const aui::Event &event) {    
    char buff[80];
    if(event.evtType != aui::evtTypeIdle && event.evtType != aui::evtTypeTimer) {
      sprintf(buff, "Received event %x <%x, %x; %p>", event.evtType, event.arg1, event.arg2, event.argp);
      Serial.println(buff);
    }
  }

} eventLogger;
#endif

class MmiStateEventDispatcher: public aui::EventListener {  
  public:
  void dispatchEvent(const aui::Event &event) {    
    if(currentMmiState.get()) {
      MmiState *next = currentMmiState->dispatchEvent(event);
      while(next) {
        MmiStateReference tempHolder = currentMmiState;
        currentMmiState = next;
        next = currentMmiState->enter();
      }
    }
  }

} stateEventDispatcher;

void setup() {
  Serial.begin(9600);
  
  Wire.begin(21, 22);
  oled_setup();
  oled_hello();

  aui::EventQueue::getInstance()->addEventSource(&board);  
  aui::EventQueue::getInstance()->addListener(&stateEventDispatcher);
  
#ifdef ENABLE_EVENT_LOGGING
  aui::EventQueue::getInstance()->addListener(&eventLogger);
#endif

Serial.println("BLAAA");
  //BoardConfig newBoard;
  //newBoard.loadForNewGame();
  //  currentMmiState = new MmiStateHwTest(aui::EventQueue::getInstance(), &board);
  //  currentMmiState = new MmiStateBoardReview(aui::EventQueue::getInstance(), &board, newBoard, new MmiStateGameTurnPickup(aui::EventQueue::getInstance(), &board, PIECE_COLOR_WHITE, newBoard));
  // currentMmiState = new MmiStateCustomBoardWaitForPlace(aui::EventQueue::getInstance(), &board, newBoard);
  
  currentMmiState = new MmiStateMainMenu(aui::EventQueue::getInstance(), &board);
  currentMmiState->enter();
}
  
void loop() {
  aui::EventQueue::getInstance()->onLoop();

}
