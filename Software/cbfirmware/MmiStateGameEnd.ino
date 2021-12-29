MmiStateGameEnd::MmiStateGameEnd(aui::EventQueue *eventQueue, BoardControls *boardControls, bool winner, PIECE_COLOR player) 
: MmiStateChessBoard(eventQueue, boardControls), _winner(winner), _player(player) {
  
}



MmiState *MmiStateGameEnd::enter() {
  oled_clear();
  oled_show_full_screen_pm(_player == PIECE_COLOR_WHITE ? OledResourceCheckmateBlackWins: OledResourceCheckmateWhiteWins);
  return NULL;
}

void MmiStateGameEnd::leave() {
  
}

MmiState *MmiStateGameEnd::dispatchEvent(const Event &event) {
  if(event.evtType == evtTypeKeyDown && event.arg1 == 8 && event.arg2 == BOARD_KEY_OK) {
     return new MmiStateMainMenu(getEventQueue(), getBoardControls(), NULL);          
  }

  return NULL;

}
