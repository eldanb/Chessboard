class MmiStateBoardReview: public MmiStateChessBoard {
  public:
    MmiStateBoardReview(aui::EventQueue *eventQueue, BoardControls *boardControls, const BoardConfig &desiredConfig, MmiStateChessBoard *nextState);    

    virtual MmiState *enter();
    virtual void leave();
    virtual MmiState *dispatchEvent(const Event &event);

  private:
    void updateDisplayAndBoardDisplay();
    
    
  private:
    BoardConfig _desiredConfig;
    int _currentReviewedPiece = -1;
    int _numBoardPieces;

    enum {
      RemovePieces,
      AddPieces,
      ReviewConfirmation,
      ReviewInProgress     
    } _currentMode;
    
    bool _readyForReview;
    MmiStateReference _nextState;
    
} ;
