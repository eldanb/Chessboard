class MmiStateCustomBoardWaitForPlace: public MmiStateChessBoard {
  public:
    MmiStateCustomBoardWaitForPlace(aui::EventQueue *eventQueue, BoardControls *boardControls, const BoardConfig &startPosition);    

    virtual MmiState *enter();
    virtual void leave();
    virtual MmiState *dispatchEvent(const Event &event);

  private:
    void updateDisplayAndBoardDisplay();
    
    
  private:
    BoardConfig _currentPosition;
} ;


class MmiStateCustomBoardWaitForPieceSelect: public MmiStateChessBoard {
  public:
    MmiStateCustomBoardWaitForPieceSelect(aui::EventQueue *eventQueue, BoardControls *boardControls, 
                                   const BoardConfig &startPosition, BoardCoordinate placed);    

    virtual MmiState *enter();
    virtual void leave();
    virtual MmiState *dispatchEvent(const Event &event);

  private:
    void updateDisplayAndBoardDisplay();
    
    
  private:
    BoardConfig _startPosition;
    BoardCoordinate _placed;
    BoardPiece _selectedPiece;    
} ;


class MmiStateCustomBoardSelectStartPlayer: public MmiStateMenu {
  public:
    MmiStateCustomBoardSelectStartPlayer(aui::EventQueue *eventQueue, BoardControls *boardControls, const BoardConfig &startPosition);    

    virtual MmiState *enter();

  private:
    virtual MmiState *onSubmit(int item);
    virtual MmiState *onBack();
    
  private:
    BoardConfig _startPosition;
} ;
