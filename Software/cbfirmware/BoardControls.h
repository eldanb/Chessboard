#ifndef __BOARDCONTROLS_H__
#define __BOARDCONTROLS_H__

using namespace aui;


#define BOARD_LED_STATE_OFF 0
#define BOARD_LED_STATE_RED 1
#define BOARD_LED_STATE_GREEN 2
#define BOARD_LED_STATE_BLINK 3

#define BOARD_KEY_UP 5
#define BOARD_KEY_DOWN 1
#define BOARD_KEY_LEFT 0
#define BOARD_KEY_RIGHT 3

#define BOARD_KEY_OK 2
#define BOARD_KEY_CANCEL 4

class BoardControls : public EventSource {
public:
  BoardControls();
  
  void onLoop();
  void onAddedToQueue(EventQueue *queue);

  void setLedState(int row, int col, int state);
  void setLedRows(int ledRows[8]);
  void clearLeds();
  
  bool getButtonDown(int row, int col);
  
private:
  void readSwitches();
  void  setRowSource(int r);
  void  setLedSinks(int s);    

private:
  int _ledRows[8];
  int _lastButtonState[10][10];
  int _stickyButtonState[10][10];
  int _pendingButtonChangeStartTime[10][10];

  aui::EventQueue *_queue;
};
  

#endif
