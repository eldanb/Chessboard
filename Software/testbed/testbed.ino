#include <Wire.h>
/*
int pinShiftClk = 7;
  int pinSrcClk = 6;
  int pinSinkClk = 5;
  int pinDs = 4;*/
  
#define DISPLAY_OLED_I2C_ADDRESS (0x78>>1)


int testPatterns[4][8] = {
  {
    0xff00,
    0xff00,
    0xff00,
    0xff00,
    0xff00,
    0xff00,
    0xff00,
    0xff00,
  },
  /*  {
    0xffff,
    0xffff,
    0xffff,
    0xffff,
    0xffff,
    0xffff,
    0xffff,
    0xffff,
    },*/
  {
    0x00ff,
    0x00ff,
    0x00ff,
    0x00ff,
    0x00ff,
    0x00ff,
    0x00ff,
    0x00ff,
  },
  {
    0xffff,
    0xffff,
    0xffff,
    0xffff,
    0xffff,
    0xffff,
    0xffff,
    0xffff,
  }
};

int rows[8] = {
  0xff81,
  0xff42,
  0xff24,
  0xff18,
  0xff18,
  0xff24,
  0xff42,
  0xff81
};


void setup() {
  // put your setup code here, to run once:
  /*pinMode(pinShiftClk, OUTPUT);
  pinMode(pinSrcClk, OUTPUT);
  pinMode(pinSinkClk, OUTPUT);
  pinMode(pinDs, OUTPUT);

*/
  Serial.begin(9600);
  Wire.begin(4, 5);
  oled_setup();
  oled_hello();
/*
  pinMode(pinSwitchShLd, OUTPUT);
  pinMode(pinSwitchClk, OUTPUT);
  pinMode(pinSwitchData, INPUT);
  pinMode(pinSwitchRowCp, OUTPUT);
  digitalWrite(pinSwitchRowCp, 0);   
*/
}

/*char rows[8] = {
  0x81,
  0x42,
  0x24,
  0x18,
  0x18,
  0x24,
  0x42,
  0x81 };*/

void verticalAnimation(int *rows, int frame, bool red) {
  for (int r = 0; r < 8; r++) {
    rows[r] = r == frame ? (red ? 0xff00 : 0x00ff) : 0;
  }
}

void horizontalAnimation(int *rows, int frame, bool red) {
  int rowPatt = (red ? 0x8000 : 0x0080) >> frame;
  for (int r = 0; r < 8; r++) {
    rows[r] = rowPatt;
  }
}

int i = 0;
int currentPattern = 0;
int currentFrame = 0;
int buttonstate[9][8];

void dumpButtons() {
  Serial.println("Button State");

  int bcount = 0;
  for (int r = 0; r < 9; r++) {
    for (int c = 0; c < 8; c++) {
      int bs = buttonstate[r][c];
      bcount += bs;
      Serial.printf("%3d", bs);
    }

    Serial.printf("\n");
  }
  Serial.printf("Total on %d \n", bcount);

}

void showButtonStatus() {
  for (int br = 0; br < 8; br++) {
    rows[br] = 0;
    for (int bc = 0; bc < 8; bc ++) {
      if (buttonstate[br][bc]) {
        rows[br] = rows[br] | (1 << (7-bc));
      }
    }
  }
}
void loop() {} 
/*
void loop() {
  long st = micros();

  // Switch pattern
  i = i + 15;
  if (i > 4000*12) {
    i = 0;
  }

  int pattern = i / 4000;
  int frame = (i % 4000) / 500;
  if (currentPattern != pattern || currentFrame != frame) {
    if (currentPattern != pattern) {
      currentPattern = pattern;
      if (!currentPattern) {
        oled_clear();
      }
      char animText[32];
      sprintf(animText, "Pattern:%02d", currentPattern);
      oled_print(0, 2, animText, 20);
    }



    currentFrame = frame;


    switch (currentPattern) {
      case 0:
        memcpy(rows, testPatterns[0], sizeof(rows));
        break;

      case 1:
        verticalAnimation(rows, currentFrame, true);
        break;

      case 2:
        verticalAnimation(rows, 7 - currentFrame, true);
        break;

      case 3:
        memcpy(rows, testPatterns[1], sizeof(rows));
        break;

      case 4:
        verticalAnimation(rows, currentFrame, false);
        break;

      case 5:
        verticalAnimation(rows, 7 - currentFrame, false);
        break;

      case 6:
      case 8:
        horizontalAnimation(rows, currentFrame, true);
        break;

      case 7:
      case 9:
        horizontalAnimation(rows, currentFrame, false);
        break;

      case 10:
      case 11:
        showButtonStatus();          
    }

  }

  // Scan rows
  for (int r = 0; r < 8; r++) {

    /*  // Clear all sources
    digitalWrite(pinDs, 0);
      for(int rb=0; rb<8; rb++) {
      digitalWrite(pinShiftClk, 0);
      digitalWrite(pinShiftClk, 1);
      }
      digitalWrite(pinSrcClk, 0);
      digitalWrite(pinSrcClk, 1);*/

/*
    // Clear all sinks
    digitalWrite(pinDs, 1);
    for (int c = 0; c < 16; c++) {
      digitalWrite(pinShiftClk, 0);
      digitalWrite(pinShiftClk, 1);
    }
    digitalWrite(pinSinkClk, 0);
    digitalWrite(pinSinkClk, 1);


    // Load row to source
    for (int rb = 0; rb < 8; rb++) {
      digitalWrite(pinShiftClk, 0);
      digitalWrite(pinDs, rb == r ? 1 : 0);
      digitalWrite(pinShiftClk, 1);
    }
 
    digitalWrite(pinSrcClk, 0);
   digitalWrite(pinSrcClk, 1);

 
    // Read all switch columns
    digitalWrite(pinSwitchShLd, 0);
      delayMicroseconds(10);

    digitalWrite(pinSwitchShLd, 1);

    bool change = false;
    // Read switches
    for (int d = 0; d < 8; d++) {
      delayMicroseconds(3);

      int cswitch = digitalRead(pinSwitchData);
      digitalWrite(pinSwitchClk, 0);
      digitalWrite(pinSwitchClk, 1);

      if (buttonstate[r][d] != cswitch) {
        change = true;
        //        Serial.printf("Switch change: %d %d = %d\n", r, d, cswitch);
        buttonstate[r][d] = cswitch;
      }
    }

     
    if (change) {
        dumpButtons();
    }
    
    // Load row to sinks
    int curRow = rows[r];
    for (int c = 0; c < 16; c++) {
      digitalWrite(pinShiftClk, 0);
      digitalWrite(pinDs, ((curRow >> c) & 1) ? 0 : 1);
      digitalWrite(pinShiftClk, 1);
    }
    digitalWrite(pinSinkClk, 0);
    digitalWrite(pinSinkClk, 1);
    delayMicroseconds(100);
    //delay(1000);

  }

  // Scan control panel switches
  digitalWrite(pinSwitchRowCp, 1);

    // Read all switch columns
    digitalWrite(pinSwitchShLd, 0);
      delayMicroseconds(10);

    digitalWrite(pinSwitchShLd, 1);

      bool change = false;
    // Read switches
    for (int d = 0; d < 8; d++) {
      delayMicroseconds(3);

      int cswitch = digitalRead(pinSwitchData);
      digitalWrite(pinSwitchClk, 0);
      digitalWrite(pinSwitchClk, 1);

      if (buttonstate[8][d] != cswitch) {
        change = true;
        //        Serial.printf("Switch change: %d %d = %d\n", r, d, cswitch);
        buttonstate[8][d] = cswitch;
      }
    }

     
    if (change) {
        dumpButtons();
    }
  digitalWrite(pinSwitchRowCp, 0);

  long cm = micros() - st;
}*/
