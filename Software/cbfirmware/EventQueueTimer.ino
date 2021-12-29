#include "EventQueueTimer.h"

namespace aui {
  
EventQueueTimer::EventQueueTimer(int msecPeriod) 
  : _queue(NULL), _period(msecPeriod), _lastTrigger(0)
{
  
}
    
void EventQueueTimer::onAddedToQueue(EventQueue *queue) {
  _lastTrigger = millis();
  _queue = queue;
}

void EventQueueTimer::onLoop() {
  long mils = millis();
  if(mils >= _lastTrigger + _period) {
    _lastTrigger = mils;

    Event evt;
    evt.evtType = evtTypeTimer;
    evt.argp = this;
    
    _queue->postEvent(evt);
  }
}

}
