#ifndef __EVENTQUEUE_H__
#define __EVENTQUEUE_H__

namespace aui {

class EventQueue;

enum EventType {
  evtTypeIdle  = 0,

  evtTypeKeyDown  = 1,
  evtTypeKeyUp    = 2,  

  evtTypeTimer    = 10,
  
  evtTypeUser1 = 100,
  evtTypeUser2 = 101,
  evtTypeUser3 = 102,
  evtTypeUser4 = 103,
  evtTypeUser5 = 104,
  evtTypeUser6 = 105,
  evtTypeUser7 = 106,
  evtTypeUser8 = 107    
} ;

struct __attribute__((packed))  Event {
     EventType evtType;
     
     union {
        struct {
          int arg1;
          int arg2;
        };

        void *argp;
     };
};

enum VirtualKeyId {
  vkFocusNext = 192,
  vkLeft,
  vkRight,
  vkSelect
};

class EventListener {
  public:
  virtual void dispatchEvent(const Event &event);
};

class EventSource { 
public:
  virtual void onAddedToQueue(EventQueue *queue);
  virtual void onLoop();
};

class EventQueue {
  
public:
  void onLoop();
  void postEvent(const Event &event);

  void addListener(EventListener *listener);
  void addEventSource(EventSource *source);
  
public:
  static EventQueue* getInstance();
  
private:
  EventQueue(byte queueLen = 96, byte maxSourceLen = 8);

  Event *_evtQueueBuff;
  byte _evtQueueBuffLen;
  byte _evtQueueBuffHead;
  byte _evtQueueBuffTail;

  const Event *_pendingSyntheticEvent;

  struct ListenerEntry {
     EventListener *_listener;
     ListenerEntry *_next;
  };

  ListenerEntry *_listeners;
  
  EventSource **_sources;
  byte _maxSources;
  byte _nSources;
  
} ;

}

#endif
