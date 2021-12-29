
class PlayerPreferencesForm {
  public:
    PlayerPreferencesForm() :
      _pickupHints("Pickup hints"),
      _placeHints("Place hints"),
      _dangerHints("Warn hints"),
      _checkMateHints("Mate hints"),
      _preferencesForm( {
      &_pickupHints, &_placeHints, &_dangerHints, &_checkMateHints, NULL
    })
    {
      _pickupHints.setValue(true);
      _placeHints.setValue(true);
    }

    MmiStateFormControl **getForm() {
      return _preferencesForm;
    }

    PlayerPreferences &getPreferences() {
      _prefRec.pickupHints = _pickupHints.getValue();
      _prefRec.placeHints = _placeHints.getValue();
      _prefRec.warnHints = _dangerHints.getValue();
      _prefRec.mateHints = _checkMateHints.getValue();
      return _prefRec;
    }

  private:
    MmiStateFormControlCheckbox _pickupHints;
    MmiStateFormControlCheckbox _placeHints;
    MmiStateFormControlCheckbox _dangerHints;
    MmiStateFormControlCheckbox _checkMateHints;

    PlayerPreferences _prefRec;

    MmiStateFormControl* _preferencesForm[5];
};

PlayerPreferencesForm whitePrefs;
static MmiStateFormControlSubForm whiteSettingsSubform("White player", whitePrefs.getForm());

PlayerPreferencesForm blackPrefs;
static MmiStateFormControlSubForm blackSettingsSubform("Black player", blackPrefs.getForm());


static MmiStateFormControlTextInput networkName("SSID");
static MmiStateFormControlTextInput networkPassword("Password");
static MmiStateFormControl *networkSettingsFormFields[] = {
  &networkName,
  &networkPassword,
  NULL
};
static MmiStateFormControlSubForm networkSettingsSubform("Network", networkSettingsFormFields);

static MmiStateFormControl* gameSettingsForm[] = {
  &whiteSettingsSubform,
  &blackSettingsSubform,
  &networkSettingsSubform,
  NULL
} ;

MmiStateGameSettings::MmiStateGameSettings(aui::EventQueue *eventQueue, BoardControls *boardControls, MmiState *backState)
  : MmiStateForm(eventQueue, boardControls, gameSettingsForm), _backState(backState)
{

}


const PlayerPreferences &MmiStateGameSettings::getPlayerPreferences(PIECE_COLOR player) {
  if (player == PIECE_COLOR_WHITE) {
    return whitePrefs.getPreferences();
  } else {
    return blackPrefs.getPreferences();
  }
}

MmiState *MmiStateGameSettings::onBack()
{
  return _backState.get();
}
