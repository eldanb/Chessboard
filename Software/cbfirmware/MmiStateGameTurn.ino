
class LightUpLedMoveVisitor: public MoveVisitor {
public:
    LightUpLedMoveVisitor(BoardControls *boardControls,
                          int moveStart, int moveEnd):
        _boardControls(boardControls), _moveStartLedState(moveStart), _moveEndLedState(moveEnd),
        _hasMoves(false)
    {
        
    }
    
    bool visitPieceMove(BoardCoordinate startCoordinate, BoardCoordinate endCoordinate) {
        _boardControls->setLedState(startCoordinate.getRow(), startCoordinate.getCol(), _moveStartLedState);
        _boardControls->setLedState(endCoordinate.getRow(), endCoordinate.getCol(), _moveEndLedState);

        _hasMoves = true;
        
        return true;
    }

    bool hasMoves() { 
      return _hasMoves;
    }
private:
    BoardControls *_boardControls;
    bool _hasMoves;
    int _moveStartLedState, _moveEndLedState;
};

class FindMoveVisitor: public MoveVisitor {
public:
    FindMoveVisitor(BoardCoordinate bc, bool seekStart):
        _soughtCoordinate(bc),
        _found(false),
        _seekStart(seekStart)
    {
        
    }
    
    bool visitPieceMove(BoardCoordinate startCoordinate, BoardCoordinate endCoordinate) {
        if( (_seekStart && _soughtCoordinate == startCoordinate) || 
            (!_seekStart && _soughtCoordinate == endCoordinate)) {
          _found = true;
          return false;
        }
        
        return true;
    }

    bool found() {
      return _found;
    }
    
private:
    bool _seekStart;
    bool _found;
    BoardCoordinate _soughtCoordinate;
};

class CaptureWarningVisitor: public MoveVisitor {
public:
    CaptureWarningVisitor(BoardControls *boardControls, const BoardConfig &startPosition, PIECE_COLOR turnPlayer):
        _startPosition(startPosition),
        _turnPlayer(turnPlayer),
        _boardControls(boardControls)
    {        
    }
    
    bool visitPieceMove(BoardCoordinate startCoordinate, BoardCoordinate endCoordinate) {
      BoardConfig assumedMove(_startPosition);
      assumedMove.applyMove(startCoordinate, endCoordinate);

      FindMoveVisitor findCapture(endCoordinate, false);
      assumedMove.visitAllMoves(!_turnPlayer, findCapture);
      if(findCapture.found()) {
        _boardControls->setLedState(endCoordinate.getRow(), endCoordinate.getCol(), BOARD_LED_STATE_RED);
      }

      return true;
    }
    
private:
    const BoardConfig &_startPosition;
    PIECE_COLOR _turnPlayer;
    BoardControls *_boardControls;
};


MmiStateGameTurnPickup::MmiStateGameTurnPickup(aui::EventQueue *eventQueue, BoardControls *boardControls, PIECE_COLOR turnPlayer, const BoardConfig &startPosition)    
  : MmiStateChessBoard(eventQueue, boardControls), _startPosition(startPosition), _turnPlayer(turnPlayer) {
}   

MmiState *MmiStateGameTurnPickup::enter() {
    bool showPickupHints = MmiStateGameSettings::getPlayerPreferences(_turnPlayer).pickupHints;
    
    getBoardControls()->clearLeds();
    LightUpLedMoveVisitor lightupMovesVisitor(getBoardControls(), showPickupHints ? BOARD_LED_STATE_GREEN : BOARD_LED_STATE_OFF, BOARD_LED_STATE_OFF);
    _startPosition.visitMovablePieces(_turnPlayer, lightupMovesVisitor);

    FindCheckCondition checkVisitor(_startPosition, _turnPlayer);
    _startPosition.visitAllImmediateMoves(!_turnPlayer, checkVisitor);

    if(!lightupMovesVisitor.hasMoves()) {
      return new MmiStateGameEnd(getEventQueue(), getBoardControls(), checkVisitor.checkFound(), _turnPlayer);
    } else {    
      oled_clear();
      if(checkVisitor.checkFound()) {
        oled_write_image_pm(_turnPlayer == PIECE_COLOR_WHITE ? OledResourceTurnStartWhite : OledResourceTurnStartBlack, 
                            128,
                            0, 36, 
                            22,
                            97, 4);
        oled_write_image_pm(OledResourceCheckIndicator, 
                            28,
                            0, 0, 
                            0,
                            28, 4);                          
  
        BoardCoordinate kingCoord;
        if(_startPosition.findPiece(BoardPiece(PIECE_TYPE_KING, _turnPlayer), kingCoord)) {
          getBoardControls()->setLedState(kingCoord.getRow(), kingCoord.getCol(), BOARD_LED_STATE_RED);
        }
      } else {
        oled_show_full_screen_pm(_turnPlayer == PIECE_COLOR_WHITE ? OledResourceTurnStartWhite : OledResourceTurnStartBlack);
      }
    }  
    return NULL;
}

void MmiStateGameTurnPickup::leave() {
  
}


MmiState *MmiStateGameTurnPickup::dispatchEvent(const Event &event) {
    if((event.evtType == evtTypeKeyDown || event.evtType == evtTypeKeyUp) && event.arg1 != 8) {
      BoardCoordinate pickedUpPiece(event.arg2, event.arg1);
      FindMoveVisitor v(pickedUpPiece, true);
      _startPosition.visitMovablePieces(_turnPlayer, v); 
      if(!v.found() || event.evtType == evtTypeKeyDown) {
        return new MmiStateBoardReview(getEventQueue(), getBoardControls(), _startPosition, this);
      } else {
        return new MmiStateGameTurnPlaceOrCapture(getEventQueue(), getBoardControls(), _turnPlayer, _startPosition, pickedUpPiece);
      }
    } else
    if(event.evtType == evtTypeKeyDown && event.arg1 == 8) {
      switch(event.arg2) {
        case BOARD_KEY_CANCEL:
          return new MmiStateMainMenu(getEventQueue(), getBoardControls(), this);          
      }
    }


    return NULL;
}





MmiStateGameTurnPlaceOrCapture::MmiStateGameTurnPlaceOrCapture(aui::EventQueue *eventQueue, BoardControls *boardControls, PIECE_COLOR turnPlayer, 
                                                       const BoardConfig &startPosition, BoardCoordinate pickedUp)    
  : MmiStateChessBoard(eventQueue, boardControls), _startPosition(startPosition), _turnPlayer(turnPlayer), _pickupPiece(pickedUp) {
}

MmiState *MmiStateGameTurnPlaceOrCapture::enter() {
    updateDisplayAndBoardDisplay();  
    return NULL;
}

void MmiStateGameTurnPlaceOrCapture::leave() {
  
}

void MmiStateGameTurnPlaceOrCapture::updateDisplayAndBoardDisplay() {
    oled_show_full_screen_pm(OledResourcePiecePickedUp);
    oled_chessboard_show_piece(0, _startPosition.getPieceAt(_pickupPiece));
    oled_chessboard_show_coord(32, _pickupPiece);

    bool showPlaceHints = MmiStateGameSettings::getPlayerPreferences(_turnPlayer).placeHints;

    getBoardControls()->clearLeds();
    LightUpLedMoveVisitor v(getBoardControls(), BOARD_LED_STATE_OFF, showPlaceHints ? BOARD_LED_STATE_GREEN : BOARD_LED_STATE_OFF);
    _startPosition.visitMovesForPieceAt(_pickupPiece, v);

    if(MmiStateGameSettings::getPlayerPreferences(_turnPlayer).warnHints) {
      CaptureWarningVisitor captureWarn(getBoardControls(), _startPosition, _turnPlayer);
      _startPosition.visitMovesForPieceAt(_pickupPiece, captureWarn);
    }
    
    getBoardControls()->setLedState(_pickupPiece.getRow(), _pickupPiece.getCol(), BOARD_LED_STATE_BLINK);
}

MmiState *MmiStateGameTurnPlaceOrCapture::dispatchEvent(const Event &event) {
    if((event.evtType == evtTypeKeyDown || event.evtType == evtTypeKeyUp) && event.arg1 != 8) {
      BoardCoordinate updatedPiece(event.arg2, event.arg1);

      // Placing down same piece? Cancel
      if(event.evtType == evtTypeKeyDown && updatedPiece == _pickupPiece) {
        return new MmiStateGameTurnPickup(getEventQueue(), getBoardControls(), _turnPlayer, _startPosition);        
      }

      // Valid move?
      FindMoveVisitor v(updatedPiece, false);
      _startPosition.visitMovesForPieceAt(_pickupPiece, v);
      if(v.found()) {
          MOVE_TYPE moveType = _startPosition.getMoveType(_pickupPiece, updatedPiece);

          // If this is not castling or capture, and we placed a piece
          if(!(moveType & (MOVE_TYPE_CASTLING | MOVE_TYPE_CAPTURE)) && event.evtType == evtTypeKeyDown) {
              // Simple move
              BoardConfig nextBoard = _startPosition;
              nextBoard.applyMove(_pickupPiece, updatedPiece);

              if(moveType & MOVE_TYPE_PROMOTION) { 
                return new MmiStateGameTurnSelectPromotedPiece(getEventQueue(), getBoardControls(), _turnPlayer, nextBoard, updatedPiece);
              } else {
                return new MmiStateGameTurnPickup(getEventQueue(), getBoardControls(), !_turnPlayer, nextBoard);
              }
          } 

          // If this is capture, and we picked up the target piece, lead user to finish the capture
          if((moveType & MOVE_TYPE_CAPTURE) && event.evtType == evtTypeKeyUp) {
              return new MmiStateGameTurnFinishCapture(getEventQueue(), getBoardControls(), _turnPlayer, _startPosition, _pickupPiece, updatedPiece, moveType & MOVE_TYPE_PROMOTION);
          } 
          
          // If this is castling, direct the player to fix the board
          if((moveType & MOVE_TYPE_CASTLING) && event.evtType == evtTypeKeyUp) {
              // Apply move
              BoardConfig nextBoard = _startPosition;
              nextBoard.applyMove(_pickupPiece, updatedPiece);

              // Ask user to fix the board according to expected state, and then move to next player's turn
              return new MmiStateBoardReview(getEventQueue(), getBoardControls(), nextBoard, 
                           new MmiStateGameTurnPickup(getEventQueue(), getBoardControls(), !_turnPlayer, nextBoard));            
          } 
          
      }

      // Illegal placement
      BoardConfig desired = _startPosition;
      desired.removePieceAt(_pickupPiece);
      return new MmiStateBoardReview(getEventQueue(), getBoardControls(), desired, this);
    } 

    return NULL;
}






MmiStateGameTurnFinishCapture::MmiStateGameTurnFinishCapture(aui::EventQueue *eventQueue, BoardControls *boardControls, PIECE_COLOR turnPlayer, 
                                                       const BoardConfig &startPosition, BoardCoordinate pickedUp, BoardCoordinate captured, bool promote)    
  : MmiStateChessBoard(eventQueue, boardControls), _startPosition(startPosition), _turnPlayer(turnPlayer), _pickupPiece(pickedUp), _capturePiece(captured), _promote(promote) {
}

MmiState *MmiStateGameTurnFinishCapture::enter() {
    updateDisplayAndBoardDisplay();  
    return NULL;
}

void MmiStateGameTurnFinishCapture::leave() {
  
}

void MmiStateGameTurnFinishCapture::updateDisplayAndBoardDisplay() {
    oled_show_full_screen_pm(OledResourceCaptureScreen);
    oled_chessboard_show_piece(0, _startPosition.getPieceAt(_pickupPiece));
    oled_chessboard_show_coord(32, _pickupPiece);
    oled_chessboard_show_coord(68, _capturePiece);
    oled_chessboard_show_piece(92, _startPosition.getPieceAt(_capturePiece));
    oled_write_image_pm(OledResourceCapturePlacePrompt, 56, 0, 25, 0, 56, 1);

    getBoardControls()->clearLeds();
    getBoardControls()->setLedState(_capturePiece.getRow(), _capturePiece.getCol(), BOARD_LED_STATE_GREEN);
}

MmiState *MmiStateGameTurnFinishCapture::dispatchEvent(const Event &event) {
    if((event.evtType == evtTypeKeyDown || event.evtType == evtTypeKeyUp) && event.arg1 != 8) {
      BoardCoordinate updatedPiece(event.arg2, event.arg1);

      if(event.evtType == evtTypeKeyDown && updatedPiece == _capturePiece) {
        // Completed succesfully
        BoardConfig nextBoard = _startPosition;
        nextBoard.applyMove(_pickupPiece, updatedPiece);

        if(_promote) {
          return new MmiStateGameTurnSelectPromotedPiece(getEventQueue(), getBoardControls(), _turnPlayer, nextBoard, _capturePiece);        
        } else {
          return new MmiStateGameTurnPickup(getEventQueue(), getBoardControls(), !_turnPlayer, nextBoard);
        }
          
      } else       
      {
        // Illegal placement
        BoardConfig desired = _startPosition;
        desired.removePieceAt(_pickupPiece);
        desired.removePieceAt(_capturePiece);
        return new MmiStateBoardReview(getEventQueue(), getBoardControls(), desired, this);
      }
    } 

    return NULL;
}



MmiStateGameTurnSelectPromotedPiece::MmiStateGameTurnSelectPromotedPiece(aui::EventQueue *eventQueue, BoardControls *boardControls, PIECE_COLOR turnPlayer, 
                                   const BoardConfig &startPosition, BoardCoordinate promoted)
  : MmiStateChessBoard(eventQueue, boardControls), _startPosition(startPosition), _turnPlayer(turnPlayer), _promoted(promoted), _selectedPiece(PIECE_TYPE_QUEEN) 
{

}    

MmiState *MmiStateGameTurnSelectPromotedPiece::enter() {
    updateDisplayAndBoardDisplay();
    return NULL;  
}

void MmiStateGameTurnSelectPromotedPiece::leave() {
}

MmiState *MmiStateGameTurnSelectPromotedPiece::dispatchEvent(const Event &event) {
  if((event.evtType == evtTypeKeyDown || event.evtType == evtTypeKeyUp) && event.arg1 != 8) {
    return new MmiStateBoardReview(getEventQueue(), getBoardControls(), _startPosition, this);
  } else 
  if(event.evtType == evtTypeKeyDown) {
    switch(event.arg2) {
      case BOARD_KEY_LEFT:
        if(_selectedPiece>2) {
          _selectedPiece = _selectedPiece - 1;
        }
        break;
        
      case BOARD_KEY_RIGHT:
        if(_selectedPiece<5) {
          _selectedPiece = _selectedPiece+1;
        }
        break;
         
      case BOARD_KEY_OK:
        _startPosition.setPieceAt(_promoted, BoardPiece(_selectedPiece, _turnPlayer));
        return new MmiStateGameTurnPickup(getEventQueue(), getBoardControls(), !_turnPlayer, _startPosition);
        break;
    }

    updateDisplayAndBoardDisplay();  
  }

  return NULL;
}


void MmiStateGameTurnSelectPromotedPiece::updateDisplayAndBoardDisplay() {
    oled_show_full_screen_pm(OledResourceCustomConfigPieceSelect);
    oled_chessboard_show_piece(0, BoardPiece(_selectedPiece, _turnPlayer));
    oled_chessboard_show_coord(32, _promoted);

    getBoardControls()->clearLeds();
    getBoardControls()->setLedState(_promoted.getRow(), _promoted.getCol(), BOARD_LED_STATE_GREEN);
}
    
    
