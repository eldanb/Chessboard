class MmiStateMainMenu : public MmiStateMenu {
  public:
    MmiStateMainMenu(aui::EventQueue *eventQueue, BoardControls *boardControls, MmiState *backState = NULL);    

  protected:
    virtual MmiState *onSubmit(int item);
    virtual MmiState *onBack();

  private:
    MmiStateReference _backState;
} ;
