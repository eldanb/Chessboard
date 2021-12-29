    
MmiStateMenu::MmiStateMenu(aui::EventQueue *eventQueue, BoardControls *boardControls, const char **options)
  : MmiStateChessBoard(eventQueue, boardControls), _options(options), _optIndex(0), _scrollIndex(0) {
}
    
MmiState *MmiStateMenu::enter() {
  oled_clear();
  getBoardControls()->clearLeds();
  updateDisplay();
  return NULL;
}

void MmiStateMenu::leave() {
}

void MmiStateMenu::onSelectionChanged(int item) {
}

MmiState *MmiStateMenu::dispatchEvent(const Event &event) {
  if(event.evtType == evtTypeKeyDown && event.arg1 == 8) {
    switch(event.arg2) {
      case  BOARD_KEY_UP:
        if(_optIndex>0) {
          _optIndex --;
          if(_optIndex < _scrollIndex) {
            _scrollIndex = _optIndex;
          }

          updateDisplay();
          onSelectionChanged(_optIndex);
        }
        break;

      case BOARD_KEY_DOWN:
        if(_options[_optIndex+1]) {
          _optIndex ++;
          if(_optIndex > _scrollIndex+3) {
            _scrollIndex = _optIndex-3;
          }

          updateDisplay();
          onSelectionChanged(_optIndex);
        }
        break;

      case BOARD_KEY_OK:
        return onSubmit(_optIndex);

      case BOARD_KEY_CANCEL:
        return onBack();

    }
  }
  
  return NULL;
}

void MmiStateMenu::updateOptions(int which) {
  if(which == -1) {
    updateDisplay();
  } else {
    int lineIdx = which - _scrollIndex;
    if(lineIdx < 4 && lineIdx >= 0) {
      char txt[17];
      memset(txt, 32, 16);
      txt[16]=0;
      memcpy(txt, _options[which], strlen(_options[which]));
      oled_print_small(0, lineIdx, txt, 16, which == _optIndex);
    }
  }
}

void MmiStateMenu::updateDisplay() {
  int idx = _scrollIndex;
  for(int line=0; line<4; line++) {
    if(!_options[idx]) {
      break;      
    }

    updateOptions(idx);

    idx++;
  }
}
  
