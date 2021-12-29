class MmiStateGameEnd: public MmiStateChessBoard {
  public:
    MmiStateGameEnd(aui::EventQueue *eventQueue, BoardControls *boardControls, bool winner, PIECE_COLOR player);    

    virtual MmiState *enter();
    virtual void leave();
    virtual MmiState *dispatchEvent(const Event &event);

  private:
    bool _winner;
    PIECE_COLOR _player;    
} ;
