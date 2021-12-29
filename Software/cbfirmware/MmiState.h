#include "EventQueue.h"

class MmiState {
  public:
    MmiState(aui::EventQueue *eventQueue): _eventQueue(eventQueue), _refCount(0) {}
    virtual ~MmiState() {}
    virtual MmiState *enter() = 0;
    virtual void leave() = 0;
    virtual MmiState *dispatchEvent(const aui::Event &event);

    void addRef() { _refCount++; }
    void releaseRef() { _refCount--; if(!_refCount) { delete this; } }
  protected:
    aui::EventQueue *getEventQueue() { return _eventQueue; }


  private:
    int _refCount;
    aui::EventQueue *_eventQueue;
} ;

class MmiStateReference {
public:
  MmiStateReference(MmiState *ref = NULL): _ref(NULL) { *this = ref; }
  MmiStateReference(const MmiStateReference &other): _ref(NULL) { *this = other; }
  ~MmiStateReference() { release(); }

  void operator=(MmiState *ref) { if(_ref != ref) { release(); _ref = ref; if(_ref) { _ref->addRef(); } } }
  void operator=(const MmiStateReference &other) { *this = other._ref; }

  MmiState* operator->() { return _ref; }
  MmiState* get() { return _ref; }
  
  void release() { if(_ref!=NULL) { _ref->releaseRef(); _ref = NULL; } }

private:   
  MmiState *_ref;
} ;


class MmiStateChessBoard: public MmiState {
  public:

    MmiStateChessBoard (aui::EventQueue *eventQueue, BoardControls *boardControls): MmiState(eventQueue), _boardControls(boardControls) {};

  protected:
    BoardControls *getBoardControls() { return _boardControls; }

  private:
    BoardControls *_boardControls;
} ;
