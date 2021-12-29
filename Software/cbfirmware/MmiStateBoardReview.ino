MmiStateBoardReview::MmiStateBoardReview(aui::EventQueue *eventQueue, BoardControls *boardControls, const BoardConfig &desiredConfig, MmiStateChessBoard *nextState)
  : MmiStateChessBoard(eventQueue, boardControls), _desiredConfig(desiredConfig), _nextState(nextState), _readyForReview(false) {
}   

MmiState *MmiStateBoardReview::enter() {
    _currentReviewedPiece = -1;
    updateDisplayAndBoardDisplay();  
    return NULL;
}

void MmiStateBoardReview::leave() {
  
}

void MmiStateBoardReview::updateDisplayAndBoardDisplay() {
  bool removePieces = false;
  bool addPieces = false;
  int pieceNumber = 0;
  
  BoardPiece currentPieceToPlace(0, 0);
  BoardCoordinate currentPieceToPlaceCoord(0, 0);
  
  for(char row=0; row<8; row++) {
    for(char col=0; col<8; col++) {
      BoardCoordinate bc(col, row);
      
      bool pieceOn = getBoardControls()->getButtonDown(row, col);
      BoardPiece desiredPiece = _desiredConfig.getPieceAt(bc);

      if(pieceOn != (desiredPiece.getPieceType()!=0)) {
        if(pieceOn) {
          removePieces = true; 
          getBoardControls()->setLedState(row, col, BOARD_LED_STATE_RED);
        } else {          
          if(pieceNumber == _currentReviewedPiece || !addPieces) 
          {
            currentPieceToPlace = desiredPiece;
            currentPieceToPlaceCoord = bc;
          }
          
          addPieces = true; 
          getBoardControls()->setLedState(row, col, BOARD_LED_STATE_GREEN);
          pieceNumber ++;
        }
      } else {
        getBoardControls()->setLedState(row, col, BOARD_LED_STATE_OFF);
      }      
    }
  }

  _numBoardPieces = pieceNumber;
  
  if(removePieces) {
    _currentMode = RemovePieces;
    oled_show_full_screen_pm(OledResourceFixError1);
  } 
  
  else if(addPieces) {
    if(_currentReviewedPiece < 0) {
      _currentReviewedPiece = 0;
    }
    if(_currentReviewedPiece > _numBoardPieces) {
      _currentReviewedPiece = 0;
    }

    _currentMode = AddPieces;
    oled_show_full_screen_pm(OledResourceFixError2);
    oled_chessboard_show_piece(0, currentPieceToPlace);
    oled_chessboard_show_coord(32, currentPieceToPlaceCoord);

    getBoardControls()->setLedState(currentPieceToPlaceCoord.getRow(), currentPieceToPlaceCoord.getCol(), BOARD_LED_STATE_BLINK);

  } 
  
  else {
    oled_show_full_screen_pm(OledResourceFixError3);
    _currentMode = ReviewConfirmation;
  }  
}

MmiState *MmiStateBoardReview::dispatchEvent(const Event &event) {
  if(event.evtType == evtTypeKeyDown && event.arg1 == 8 && event.arg2 == BOARD_KEY_CANCEL) {
     return new MmiStateMainMenu(getEventQueue(), getBoardControls(), this);          
  }

  switch(_currentMode) {
    case RemovePieces:
      if((event.evtType == evtTypeKeyDown || event.evtType == evtTypeKeyUp) && event.arg1 != 8) {
        // Board piece config updated
        _currentReviewedPiece = -1;
        updateDisplayAndBoardDisplay();
      } 
      break;

    case AddPieces:
      if((event.evtType == evtTypeKeyDown || event.evtType == evtTypeKeyUp) && event.arg1 != 8) {
        // Board piece config updated
        _currentReviewedPiece = -1;
        updateDisplayAndBoardDisplay();
      } else 
      if(event.evtType == evtTypeKeyDown && event.arg1 == 8 && _currentReviewedPiece != -1) {
        Serial.printf("KEY %d\n", event.arg2);
        switch(event.arg2) {
          case BOARD_KEY_UP:
            _currentReviewedPiece--;
            if(_currentReviewedPiece<0) {
              _currentReviewedPiece = _numBoardPieces-1;
            }
            break;
          case BOARD_KEY_DOWN:
            _currentReviewedPiece++;
            if(_currentReviewedPiece >= _numBoardPieces) {
              _currentReviewedPiece = 0;
            }
            break;
        }
        updateDisplayAndBoardDisplay();
      }
      break;

    case ReviewConfirmation:
        if((event.evtType == evtTypeKeyDown || event.evtType == evtTypeKeyUp) && event.arg1 != 8) {
          // Board piece config updated
          _currentReviewedPiece = -1;
          updateDisplayAndBoardDisplay();
        } else 
        if(event.evtType == evtTypeKeyDown && event.arg1 == 8) {
          switch(event.arg2) {
            case BOARD_KEY_OK:
              return _nextState.get();

            case BOARD_KEY_CANCEL:
              _currentMode = ReviewInProgress;            
              updateDisplayAndBoardDisplay();
              break;
          }
        }
        break;    
  }


  return NULL;

}
