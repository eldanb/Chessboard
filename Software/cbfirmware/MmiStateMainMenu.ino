static const char *mainMenuOptions[] = { 
    "New Game",
    "Custom Board",
    "Game Setting",
    "HW Test",
    NULL
};


MmiStateMainMenu::MmiStateMainMenu(aui::EventQueue *eventQueue, BoardControls *boardControls, MmiState *backState)    
  : MmiStateMenu(eventQueue, boardControls, mainMenuOptions), _backState(backState) {
}
    

MmiState *MmiStateMainMenu::onSubmit(int item) {
  BoardConfig newBoard;
  
  switch(item) {
    case 0:
      newBoard.loadForNewGame();
      return new MmiStateBoardReview(aui::EventQueue::getInstance(), &board, newBoard, 
                  new MmiStateGameTurnPickup(aui::EventQueue::getInstance(), &board, PIECE_COLOR_WHITE, newBoard));
                  
    case 1:
      return new MmiStateCustomBoardWaitForPlace(aui::EventQueue::getInstance(), &board, newBoard);    

    case 2:
      return new MmiStateGameSettings(aui::EventQueue::getInstance(), &board, this);

    case 3:
      return new MmiStateHwTest(aui::EventQueue::getInstance(), &board);
      
    default:
      return NULL;
  }
}

MmiState *MmiStateMainMenu::onBack() {
  return _backState.get();
}

  
