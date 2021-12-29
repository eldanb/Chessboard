class MmiStateMenu : public MmiStateChessBoard {
  public:
    MmiStateMenu(aui::EventQueue *eventQueue, BoardControls *boardControls, const char **option);    
    virtual MmiState *enter();
    virtual void leave();
    virtual MmiState *dispatchEvent(const Event &event);

  protected:
    virtual void onSelectionChanged(int item);
    virtual MmiState *onSubmit(int item) = 0;
    virtual MmiState *onBack() = 0;

    void updateOptions(int which = -1);
    
  private:
    void updateDisplay();
            
  private:
    const char **_options;

    int _optIndex;
    int _scrollIndex;
} ;
