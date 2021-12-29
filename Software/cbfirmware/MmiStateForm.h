#include <string>

class MmiStateForm;

#define MAX_FORM_SIZE 16

class MmiStateFormControl {
public:
  virtual const char *render(MmiStateForm *sender) = 0;
  virtual MmiStateChessBoard *onSelect(MmiStateForm *sender) = 0;
};

class MmiStateFormControlSubForm: public MmiStateFormControl {
public:
  MmiStateFormControlSubForm(const char *label, MmiStateFormControl **form);
  
  const char *render(MmiStateForm *sender);
  MmiStateChessBoard *onSelect(MmiStateForm *sender);

private:
  MmiStateFormControl **_form;
  const char *_label;
};

class MmiStateFormControlCheckbox: public MmiStateFormControl {
public:
  MmiStateFormControlCheckbox(const char *label);

  bool getValue() const { return _value; }
  void setValue(bool value);
  
  const char *render(MmiStateForm *sender);
  MmiStateChessBoard *onSelect(MmiStateForm *sender);

private:
  bool _value;
  char _label[17];
};


class MmiStateFormControlTextInput: public MmiStateFormControl {
public:
  MmiStateFormControlTextInput(const char *label);

  const char *getValue() const { return _value.c_str(); }
  void setValue(const char *value);
  
  const char *render(MmiStateForm *sender);
  MmiStateChessBoard *onSelect(MmiStateForm *sender);

private:
  std::string _value;
  char _label[17];
};




class MmiStateForm : public MmiStateMenu{
  public:
    MmiStateForm(aui::EventQueue *eventQueue, BoardControls *boardControls, MmiStateFormControl **form);    

    aui::EventQueue *getEventQueue() { return MmiStateMenu::getEventQueue(); }
    BoardControls *getBoardControls() { return MmiStateMenu::getBoardControls(); }

  protected:
    virtual MmiState *enter();
    virtual MmiState *onSubmit(int item);

    void updateForm(MmiStateFormControl **form);

  private:
    void loadFormToMenuContent();
    
  private:
    MmiStateFormControl **_form;
    const char *_menuContent[MAX_FORM_SIZE];
} ;
