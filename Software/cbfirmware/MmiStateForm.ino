MmiStateForm::MmiStateForm(aui::EventQueue *eventQueue, BoardControls *boardControls, MmiStateFormControl **form)
  : MmiStateMenu(eventQueue, boardControls, _menuContent), _form(form) {
  loadFormToMenuContent();
}

void MmiStateForm::updateForm(MmiStateFormControl **form) {
  _form = form;
  loadFormToMenuContent();
  updateOptions();
}

MmiState *MmiStateForm::enter() {
  loadFormToMenuContent();
  return MmiStateMenu::enter();
}

void MmiStateForm::loadFormToMenuContent() {
  const char **ctlText = _menuContent;
  for(MmiStateFormControl **ctl = _form; *ctl; ctl++, ctlText++) {
    *ctlText = (*ctl)->render(this);
  }
  *ctlText = NULL;
}

MmiState *MmiStateForm::onSubmit(int item)  {
  MmiState *next = _form[item]->onSelect(this);
  if(!next) {
    _menuContent[item] = _form[item]->render(this);
    updateOptions(item);
  }

  return next;
}





class MmiStateSubForm: public MmiStateForm {
public:
  MmiStateSubForm(MmiStateForm *parent,  MmiStateFormControl **form) 
    : MmiStateForm(parent->getEventQueue(), parent->getBoardControls(), form), _backState(parent) {
      
  }

  MmiState *onBack() {
    return _backState.get();
  }

private:
  MmiStateReference _backState;
};

MmiStateFormControlSubForm::MmiStateFormControlSubForm(const char *label, MmiStateFormControl **form)
   : _label(label), _form(form) {
   
}
  
const char *MmiStateFormControlSubForm::render(MmiStateForm *sender) {
  return _label;    
}

MmiStateChessBoard *MmiStateFormControlSubForm::onSelect(MmiStateForm *sender) {
  return new MmiStateSubForm(sender, _form);
}


MmiStateFormControlCheckbox::MmiStateFormControlCheckbox(const char *label) {
  memcpy(_label, "                ", sizeof(_label));
  memcpy(_label, label, strlen(label));

  setValue(false);
}

void MmiStateFormControlCheckbox::setValue(bool value) { 
  _value = value;
  _label[15] = _value ? '%' : '#'; 
}

const char *MmiStateFormControlCheckbox::render(MmiStateForm *sender) {
  return _label;
}

MmiStateChessBoard *MmiStateFormControlCheckbox::onSelect(MmiStateForm *sender) {
  setValue(!getValue());
  return NULL;
}


///////////////////////////////////////////////////////////////////////////////////////////////

static const char *keyboardPages[][3] = {
  { "ABCDEFGHIJKLMNOP",
    "QRSTUVWXYZ _.,'\"",
    "0123456789    <."
  },
  {
    "abcdefghijklmnop",
    "qrstuvwxyz _.,'\"",
    "0123456789    <."
  },
  {
    "!@#$%^&*(){}[]<>",
    "-+=|\\/?         ",
    "              <."
  }
};

class MmiStateTextEditor : public MmiStateChessBoard {
public:
  MmiStateTextEditor(aui::EventQueue *eventQueue, BoardControls *boardControls, MmiStateChessBoard *originState, std::string &value) 
    : MmiStateChessBoard(eventQueue, boardControls), 
      _value(value),
      _originState(originState), _textCursor(0), _textScrollCursor(0), _optionCursor(0), _keyboardPageIndex(0) {
  }

  virtual MmiState *enter() {
    setupUi();
    return NULL;
  }
  
  virtual void leave() {
    
  }

  virtual MmiState *dispatchEvent(const aui::Event &event) {
    if(event.evtType == evtTypeKeyDown && event.arg1 == 8) {
      switch(event.arg2) {
        case BOARD_KEY_UP:
          hideCursors();
          menuCursorUp();
          showCursors();
          break;
          
         case BOARD_KEY_DOWN:
          hideCursors();
          menuCursorDown();
          showCursors();
          break;
  
        case BOARD_KEY_LEFT:
          hideCursors();
          if(_optionCursor>0 && _optionCursor % 16 > 0) {
            _optionCursor --;
          } else
          if(_optionCursor == -1 && _textCursor > 0 ) {
            if(textCursorLeft()) {
              updateTextLine();
            }
          }
          showCursors();
          break;
  
        case BOARD_KEY_RIGHT:
          hideCursors();
          if(_optionCursor>=0 && _optionCursor % 16 < 15) {
            _optionCursor ++;
          } else
          if(_optionCursor == -1 && _textCursor < _value.length()) {
            if(textCursorRight()) {
              updateTextLine();
            }
          }
          showCursors();
          break;
  
        case BOARD_KEY_OK:
          if(_optionCursor >= 0 && _optionCursor < 46) {
            hideCursors();

            int row, col;
            char menuChar = getCurrentOpt(&col, &row);

            _value.insert(_value.begin() + _textCursor, menuChar);
            textCursorRight();

            updateTextLine();
            showCursors();
          } else 
          if(_optionCursor == 47) {
            hideCursors();
            _keyboardPageIndex++;
            if(_keyboardPageIndex>2) {
              _keyboardPageIndex = 0;
            }
            updateKeyboard();
            showCursors();
          } else
          if(_optionCursor == 46 && _textCursor > 0) {
            hideCursors();
            textCursorLeft();
            _value.erase(_value.begin()+_textCursor);
            updateTextLine();
            showCursors();
          }
          break;
          
        case BOARD_KEY_CANCEL:
          return _originState.get();
  
      }
    }

    return NULL;
  }
  

  void setValue(const std::string &val) {
    _value = val;
  }

private:
  void menuCursorDown() {
    if(_optionCursor < 0) {
      _optionCursor = 0;
    } else 
    if(_optionCursor < 32) {
      _optionCursor += 16;
    }
  }

  void menuCursorUp() {
    if(_optionCursor >= 16) {
       _optionCursor -= 16;
    } else {
       _optionCursor = -1;
    }
  }

  bool textCursorLeft() {
    _textCursor --;
    if(_textCursor - _textScrollCursor < 0) {
      _textScrollCursor = _textCursor;
      return true;
    }

    return false;
  }

  bool textCursorRight() {
    _textCursor ++;
    if(_textCursor - _textScrollCursor >= 16) {
      _textScrollCursor = _textCursor - 15;
      return true;
    }
    
    return false;
  }
            
  void setupUi() {
    updateKeyboard();
    updateTextLine();
    showCursors();    
  }

  void updateTextLine() {
    char text[16] = "";
    int len = _value.length()-_textScrollCursor;
    if(len > 16) {
      len = 16;
    }
    
    memset(text, ' ', 16);    
    memcpy(text, _value.c_str() + _textScrollCursor, len); 
    oled_print_small(0, 0, text, 16, false);      
  }

  void updateKeyboard() {
    const char **keyboardPage = keyboardPages[_keyboardPageIndex];
    for(int row=0; row<3; row++) {
      oled_print_small(0, row+1, keyboardPage[row], 16, false);      
    }    
  }
  
  void hideCursors() {
    showOptCursor(false);
    showTextCursor(false);
  }

  void showCursors() {
    showOptCursor(true);
    showTextCursor(true);
  }

  char getCurrentOpt(int *col, int *row) {
    const char **keyboardPage = keyboardPages[_keyboardPageIndex];
    *row = (_optionCursor / 16);
    *col = (_optionCursor % 16);
    return keyboardPage[*row][*col];
  }
  
  void showOptCursor(bool show) {
    int row, col;
    char menuChar = getCurrentOpt(&col, &row);
    oled_print_small( col*7, row+1, &menuChar, 1, show);      
  }

  void showTextCursor(bool show) {
    const char *text = _textCursor < _value.length() ? _value.c_str() + _textCursor : " ";
    int col = _textCursor - _textScrollCursor;    
    oled_print_small( col*7, 0, text, 1, show);      
  }

private:
  MmiStateReference _originState;
  std::string &_value;
  int _textCursor;
  int _textScrollCursor;
  int _optionCursor;
  int _keyboardPageIndex;
} ;

MmiStateFormControlTextInput::MmiStateFormControlTextInput(const char *label) {
  memcpy(_label, "                ", sizeof(_label));
  memcpy(_label, label, strlen(label));

}

  
const char *MmiStateFormControlTextInput::render(MmiStateForm *sender) {
  return _label;
}

void MmiStateFormControlTextInput::setValue(const char *value) {
  _value = value;
}

MmiStateChessBoard *MmiStateFormControlTextInput::onSelect(MmiStateForm *sender) {
  MmiStateTextEditor *newState = new MmiStateTextEditor(sender->getEventQueue(), sender->getBoardControls(), sender, _value);
  return newState;
}
