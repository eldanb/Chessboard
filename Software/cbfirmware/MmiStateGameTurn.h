class MmiStateGameTurnPickup: public MmiStateChessBoard {
  public:
    MmiStateGameTurnPickup(aui::EventQueue *eventQueue, BoardControls *boardControls, PIECE_COLOR turnPlayer, const BoardConfig &startPosition);    

    virtual MmiState *enter();
    virtual void leave();
    virtual MmiState *dispatchEvent(const Event &event);
    
  private:
    BoardConfig _startPosition;
    PIECE_COLOR _turnPlayer;
} ;


class MmiStateGameTurnPlaceOrCapture: public MmiStateChessBoard {
  public:
    MmiStateGameTurnPlaceOrCapture(aui::EventQueue *eventQueue, BoardControls *boardControls, PIECE_COLOR turnPlayer, 
                                   const BoardConfig &startPosition, BoardCoordinate pickedUp);    

    virtual MmiState *enter();
    virtual void leave();
    virtual MmiState *dispatchEvent(const Event &event);

  private:
    void updateDisplayAndBoardDisplay();
    
    
  private:
    BoardConfig _startPosition;
    PIECE_COLOR _turnPlayer;
    BoardCoordinate _pickupPiece;    
} ;

class MmiStateGameTurnFinishCapture: public MmiStateChessBoard {
  public:
    MmiStateGameTurnFinishCapture(aui::EventQueue *eventQueue, BoardControls *boardControls, PIECE_COLOR turnPlayer, 
                                   const BoardConfig &startPosition, BoardCoordinate pickedUp, BoardCoordinate captured, bool promote);    

    virtual MmiState *enter();
    virtual void leave();
    virtual MmiState *dispatchEvent(const Event &event);

  private:
    void updateDisplayAndBoardDisplay();
    
    
  private:
    BoardConfig _startPosition;
    PIECE_COLOR _turnPlayer;
    BoardCoordinate _pickupPiece;    
    BoardCoordinate _capturePiece;    
    bool _promote;
} ;

class MmiStateGameTurnSelectPromotedPiece: public MmiStateChessBoard {
  public:
    MmiStateGameTurnSelectPromotedPiece(aui::EventQueue *eventQueue, BoardControls *boardControls, PIECE_COLOR turnPlayer, 
                                   const BoardConfig &startPosition, BoardCoordinate promoted);    

    virtual MmiState *enter();
    virtual void leave();
    virtual MmiState *dispatchEvent(const Event &event);

  private:
    void updateDisplayAndBoardDisplay();
    
    
  private:
    BoardConfig _startPosition;
    PIECE_COLOR _turnPlayer;
    BoardCoordinate _promoted;

    PIECE_TYPE _selectedPiece;
} ;
