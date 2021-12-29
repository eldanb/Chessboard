#ifndef __EVENTQUEUETIMER_H__
#define __EVENTQUEUETIMER_H__

namespace aui {
  class EventQueueTimer : public EventSource { 
    public:
    EventQueueTimer(int msecPeriod);
    
    virtual void onAddedToQueue(EventQueue *queue);
    virtual void onLoop();

    private:
      EventQueue *_queue;
      int _period;
      long _lastTrigger;
  };
}
#endif
