static const char *hwTestOptions[] = { 
    "Green       ",
    "Red         ",
    "Alternate   ",
    "V. Animation",
    "H. Animation",
    "Random      ",
    "Reed Echo   ",
    NULL
};

      
MmiStateHwTest::MmiStateHwTest(aui::EventQueue *eventQueue, BoardControls *boardControls)
  : MmiStateMenu(eventQueue, boardControls, hwTestOptions), _refreshTimer(50), _currentFrame(0) {
}
    
MmiState *MmiStateHwTest::enter() {
  MmiStateMenu::enter();
  _currentPattern = 0;
  getEventQueue()->addEventSource(&_refreshTimer);
  return NULL;
}

void MmiStateHwTest::leave() {
  MmiStateMenu::leave();
  // TODO remove timer
}

void MmiStateHwTest::updateBoard() {
  int ledRows[8];
  
  switch(_currentPattern) {
    case 0:
      for(int i=0; i<8; i++) ledRows[i]=0xff;
      break;
      
    case 1:
      for(int i=0; i<8; i++) ledRows[i]=0xff00;
      break;

    case 2:
      for(int i=0; i<8; i++) ledRows[i] = i & 1 ? 0xaa55 : 0x55aa;      
      break;

    case 3:
      for(int i=0; i<8; i++) ledRows[i] = (0x1 << (_currentFrame & 0x0f));
      break;

    case 4:
      for(int i=0; i<8; i++) ledRows[i] = (i == (_currentFrame & 7)) ? (_currentFrame & 8 ? 0xff : 0xff00) : 0;
      break;
    
    case 5:
      for(int i=0; i<8; i++) ledRows[i] = rand();
      break;

    case 6:
      for(int r=0; r<8; r++) {
        ledRows[r] = 0;
        for(int c=0; c<8; c++) { 
          if(getBoardControls()->getButtonDown(r, c)) {
            ledRows[r] = ledRows[r] | ((1 << 7-c)) << 8;
          }
        }
      } 
        
      break;

  }

  getBoardControls()->setLedRows(ledRows);
}

void MmiStateHwTest::onSelectionChanged(int item) {
  _currentPattern = item;
}

MmiState *MmiStateHwTest::dispatchEvent(const Event &event) {
  if(event.evtType == evtTypeTimer && event.argp == &_refreshTimer) {
    updateBoard();
    _currentFrame++;
    return NULL;    
  } else {
    return MmiStateMenu::dispatchEvent(event);
  }
}

MmiState *MmiStateHwTest::onSubmit(int item) {
  return NULL;
}

MmiState *MmiStateHwTest::onBack() {
  return new MmiStateMainMenu(getEventQueue(), getBoardControls());
}

  
