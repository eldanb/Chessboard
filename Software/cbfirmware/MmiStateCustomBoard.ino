


MmiStateCustomBoardWaitForPlace::MmiStateCustomBoardWaitForPlace(aui::EventQueue *eventQueue, BoardControls *boardControls, const BoardConfig &startPosition) 
  : MmiStateChessBoard(eventQueue, boardControls), _currentPosition(startPosition) {
}   


MmiState *MmiStateCustomBoardWaitForPlace::enter() {
    updateDisplayAndBoardDisplay();  
    return NULL;
}

void MmiStateCustomBoardWaitForPlace::leave() {
  
}

void MmiStateCustomBoardWaitForPlace::updateDisplayAndBoardDisplay() {
    oled_clear();
    oled_show_full_screen_pm(OledResourceCustomConfigPage);
    getBoardControls()->clearLeds();
    for(char row=0; row<8; row++) {
      for(char col=0; col<8; col++) {
        BoardCoordinate bc(col, row);
        if(_currentPosition.getPieceAt(bc).getPieceType()) {
          getBoardControls()->setLedState(row, col, BOARD_LED_STATE_GREEN);          
        }
      }
    }
}

MmiState *MmiStateCustomBoardWaitForPlace::dispatchEvent(const Event &event) {
    if((event.evtType == evtTypeKeyDown || event.evtType == evtTypeKeyUp) && event.arg1 != 8) {
      BoardCoordinate updatedPiece(event.arg2, event.arg1);

      if(event.evtType == evtTypeKeyUp) {
        _currentPosition.setPieceAt(updatedPiece, BoardPiece(0, 0));
        updateDisplayAndBoardDisplay();
        return NULL;
      } else {
        return new MmiStateCustomBoardWaitForPieceSelect(getEventQueue(), getBoardControls(), _currentPosition, updatedPiece);
      }
    } else 
    if(event.evtType == evtTypeKeyDown && event.arg1 == 8) {
      switch(event.arg2) {
        case BOARD_KEY_OK:
          return new MmiStateCustomBoardSelectStartPlayer(getEventQueue(), getBoardControls(), _currentPosition);
          break;

        case BOARD_KEY_CANCEL:
          return new MmiStateMainMenu(getEventQueue(), getBoardControls(), this);          
          break;        
      }
    }

    return NULL;
}



MmiStateCustomBoardWaitForPieceSelect::MmiStateCustomBoardWaitForPieceSelect(aui::EventQueue *eventQueue, BoardControls *boardControls, 
                                                       const BoardConfig &startPosition, BoardCoordinate placed)    
  : MmiStateChessBoard(eventQueue, boardControls), _startPosition(startPosition), _placed(placed), _selectedPiece(1, 0) {
}

MmiState *MmiStateCustomBoardWaitForPieceSelect::enter() {
    updateDisplayAndBoardDisplay();
    return NULL;  
}

void MmiStateCustomBoardWaitForPieceSelect::leave() {
  
}

void MmiStateCustomBoardWaitForPieceSelect::updateDisplayAndBoardDisplay() {
    oled_show_full_screen_pm(OledResourceCustomConfigPieceSelect);
    oled_chessboard_show_piece(0, _selectedPiece);
    oled_chessboard_show_coord(32, _placed);

    getBoardControls()->clearLeds();
    getBoardControls()->setLedState(_placed.getRow(), _placed.getCol(), BOARD_LED_STATE_GREEN);
}

MmiState *MmiStateCustomBoardWaitForPieceSelect::dispatchEvent(const Event &event) {
    if((event.evtType == evtTypeKeyDown || event.evtType == evtTypeKeyUp) && event.arg1 != 8) {
      BoardCoordinate updatedPiece(event.arg2, event.arg1);

      if(updatedPiece == _placed && event.evtType == evtTypeKeyUp) {
        return new MmiStateCustomBoardWaitForPlace(getEventQueue(), getBoardControls(), _startPosition);
      } else {
        return new MmiStateBoardReview(getEventQueue(), getBoardControls(), _startPosition, 
          new MmiStateCustomBoardWaitForPlace(getEventQueue(), getBoardControls(), _startPosition));
      }
    } else 
    if(event.evtType == evtTypeKeyDown) {
      switch(event.arg2) {
        case BOARD_KEY_LEFT:
          if(_selectedPiece.getPieceType()>1) {
            _selectedPiece = BoardPiece(_selectedPiece.getPieceType()-1, _selectedPiece.getPieceColor());
          }
          break;
          
        case BOARD_KEY_RIGHT:
          if(_selectedPiece.getPieceType()<6) {
            _selectedPiece = BoardPiece(_selectedPiece.getPieceType()+1, _selectedPiece.getPieceColor());
          }
          break;
           
        case BOARD_KEY_DOWN:
          _selectedPiece = BoardPiece(_selectedPiece.getPieceType(), PIECE_COLOR_WHITE);
          break;
          
        case BOARD_KEY_UP:
          _selectedPiece = BoardPiece(_selectedPiece.getPieceType(), PIECE_COLOR_BLACK);
          break;

        case BOARD_KEY_OK:
          _startPosition.setPieceAt(_placed, _selectedPiece);
          return new MmiStateCustomBoardWaitForPlace(getEventQueue(), getBoardControls(), _startPosition);
          break;
      }
  
      updateDisplayAndBoardDisplay();  
    }

    return NULL;
}



static const char *gameOptions[] = { 
  "White Starts",
  "Black Starts",
  NULL  
};

MmiStateCustomBoardSelectStartPlayer::MmiStateCustomBoardSelectStartPlayer(aui::EventQueue *eventQueue, BoardControls *boardControls, const BoardConfig &startPosition) 
  : MmiStateMenu(eventQueue, boardControls, gameOptions), _startPosition(startPosition) {
    
}

MmiState *MmiStateCustomBoardSelectStartPlayer::enter() {
  MmiStateMenu::enter();
  getBoardControls()->clearLeds();
  return NULL;
}


MmiState *MmiStateCustomBoardSelectStartPlayer::onSubmit(int item) {
  _startPosition.loadPlayerStateFromCustomBoardPosition();
  return new MmiStateGameTurnPickup(getEventQueue(), getBoardControls(), item == 0 ? PIECE_COLOR_WHITE : PIECE_COLOR_BLACK, _startPosition);    
  
}

MmiState *MmiStateCustomBoardSelectStartPlayer::onBack() {
  return new  MmiStateCustomBoardWaitForPlace(getEventQueue(), getBoardControls(), _startPosition);
}
    
 
