class Timer {
  
  int savedTime;
  int totalTime; 
  float msTime;
  int tempTime;
  boolean end;

  Timer(int tempTotalTime) {
      totalTime = tempTotalTime;
  }

  void start() {
      savedTime = millis();
  }

  float getCurrentTime() {
      return (msTime = tempTime/1000.0);
  }

  void reset() {
      tempTime = 0;
      start();
  }
  
  boolean isDone(){
      return end;
  }

  void update() { 
      tempTime = millis()- savedTime;
      if (tempTime > totalTime) {
          end =  true;
      }   
      else {
          end = false;
      }
  }
}
