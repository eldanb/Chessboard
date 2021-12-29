class MmiStateHwTest : public MmiStateMenu {
  public:
    MmiStateHwTest(aui::EventQueue *eventQueue, BoardControls *boardControls);    
    virtual MmiState *enter();
    virtual void leave();
    virtual MmiState *dispatchEvent(const Event &event);

  protected:
    virtual void onSelectionChanged(int item);
    virtual MmiState *onSubmit(int item);
    virtual MmiState *onBack();

  private:
    void updateBoard();
        
  private:
    int _currentPattern;
    int _currentFrame;
    aui::EventQueueTimer _refreshTimer;    
} ;
