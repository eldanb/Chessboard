#include "EventQueue.h"

namespace aui {

const Event __IDLE_EVENT = { evtTypeIdle, 0, 0 };

EventQueue::EventQueue(byte queueLen, byte maxSourceLen) 
   : _evtQueueBuff((Event*)malloc(sizeof(Event) * queueLen)),
     _evtQueueBuffLen(queueLen),
     _evtQueueBuffHead(0),
     _evtQueueBuffTail(0),
     _listeners(NULL),
     _pendingSyntheticEvent(NULL), 
     _sources((EventSource**)malloc(sizeof(EventSource*)*maxSourceLen)),
     _nSources(0),
     _maxSources(maxSourceLen)
{
  _sources[0] = NULL;
}

void EventQueue::onLoop() {
  EventSource **src = _sources;
  while(*src) {
    (*src)->onLoop();
    src++;
  }
  
  const Event *eventToDispatch = NULL;
  if(_pendingSyntheticEvent) {
    eventToDispatch = _pendingSyntheticEvent;
    _pendingSyntheticEvent = NULL;
  } else 
  if(_evtQueueBuffHead != _evtQueueBuffTail) {
    eventToDispatch = &_evtQueueBuff[_evtQueueBuffHead];
    
    _evtQueueBuffHead = (_evtQueueBuffHead + 1) % _evtQueueBuffLen;

    if(_evtQueueBuffHead == _evtQueueBuffTail) {
      _pendingSyntheticEvent = &__IDLE_EVENT;
    }
  } 

  if(eventToDispatch) {
    ListenerEntry *curListener = _listeners;
    while(curListener) {
      curListener->_listener->dispatchEvent(*eventToDispatch); 
      curListener = curListener->_next;
    }
  } 
}

void EventQueue::postEvent(const Event &event) {
  int newTail = (_evtQueueBuffTail + 1 ) % _evtQueueBuffLen;
  if(newTail == _evtQueueBuffHead) { 
    abort();
  }

  _evtQueueBuff[_evtQueueBuffHead] = event;

  _evtQueueBuffTail = newTail;
}

void EventQueue::addListener(EventListener *listener) {
  ListenerEntry *newEntry = (ListenerEntry*)malloc(sizeof(ListenerEntry));
  newEntry->_next = _listeners;
  newEntry->_listener = listener;

  _listeners = newEntry;  
}

void EventQueue::addEventSource(EventSource *source) {
  if(_nSources >= _maxSources) {
    abort();
  }

  _sources[_nSources] = source;  
  _nSources++;

  _sources[_nSources] = NULL;


  source->onAddedToQueue(this);
}


static EventQueue* __instance = NULL;
 
EventQueue* EventQueue::getInstance() {
  if(!__instance) { 
    __instance = new EventQueue();
  }

  return __instance;
}

}
