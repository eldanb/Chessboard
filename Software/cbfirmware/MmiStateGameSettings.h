
struct PlayerPreferences {
  bool pickupHints;
  bool placeHints;
  bool warnHints;
  bool mateHints;
};

static MmiStateFormControlCheckbox whitePickupHints("Pickup hints");
static MmiStateFormControlCheckbox whitePlaceHints("Place hints");
static MmiStateFormControlCheckbox whiteDangerHints("Warn hints");
static MmiStateFormControlCheckbox whiteCheckMateHints("Mate hints");

class MmiStateGameSettings : public MmiStateForm {
  public:
    MmiStateGameSettings(aui::EventQueue *eventQueue, BoardControls *boardControls, MmiState *backState);
    MmiState *onBack();

  public:
    static const PlayerPreferences &getPlayerPreferences(PIECE_COLOR player);
    
  private:
    MmiStateReference _backState;
} ;
