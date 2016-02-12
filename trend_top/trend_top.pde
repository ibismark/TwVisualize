/*
twitterトレンドランキングを視覚化
ランキングが高ければ中心に、低ければ外側に位置
*/


import processing.opengl.*; 
import twitter4j.conf.*;
import twitter4j.api.*;
import twitter4j.*;
import java.util.List;
import java.util.Iterator;
import java.util.*;
  
PFont font;  


ConfigurationBuilder cb;
Query query;
Twitter twitter;
Trends trends;
List<Trend> ttList;
long t;
Timer time;
int interval = 60000*10;
ArrayList<String> trendList;
int trendId =   23424856; //Japan whoid (http://woeid.rosselliot.co.nz/lookup/japan)



void setup() {  
  size(displayWidth, displayHeight, OPENGL);
  frameRate(20);   
  // font  
  font = createFont("Meiryo", 28, true);
  ttList = new ArrayList<Trend>();
  
  
  //APIキー
  cb = new ConfigurationBuilder();
  cb.setOAuthConsumerKey("xN0UOvUWefgAQJigDTNHu8VuE");
  cb.setOAuthConsumerSecret("23mAbFQiDgMbTqeZQN5BZhqnYkVosyplq6PytwmzxGJutmTdgy");
  cb.setOAuthAccessToken("1035544124-J9T5YBNeFmYMNELO5RHvJ8nbn6MvHbLEZwJAcup");
  cb.setOAuthAccessTokenSecret("ITHQ0kaYxsLyQ7wKQN30VeHxT0Dg97AqLQxzmWuSOIVFW");

  //create twitter object
  twitter = new TwitterFactory(cb.build()).getInstance();
  trendList = queryTwitter();
  
  //update time
  time = new Timer(interval);
  time.start();  //start timer

    
}  
  

void draw() {
  background(50);
  float angle = 0.05f * radians(t);
  camera(0, -mouseY, mouseX, 0, 0, 0, 0, 1, 0);
  rotateY(angle);
  
  for(int i = 0; i < ttList.size(); ++i) {  
          ttList.get(i).update();  
  }
  
  //drawing ground
  pushStyle();
      stroke(0, 255, 0);
      for(int x = -1000; x <= 1000; x += 100){
          line(x, 0, -1000, x, 0, 1000);
      }
      for(int z = -1000; z <= 1000; z += 100){
          line(-1000, 0, z, 1000, 0, z);
      }
  
      stroke(255, 0, 0);
      line(0, -500, 0, 0, 500, 0);
  popStyle();
  
  
  if(time.isDone()) {
          trendList = queryTwitter();
          time.reset();
      }
  
  t++;
 
}



//access twitter server
ArrayList<String> queryTwitter() {
  ArrayList<String> twitt = new ArrayList<String>();
  try{
    
      trends = twitter.getPlaceTrends(trendId);
      for (int i = 0; i < trends.getTrends().length; i++) {
          println(trends.getTrends()[i].getName());
          twitt.add(trends.getTrends()[i].getName());      //test
          ttList.add(new Trend(trends, i));
      }
    
  }catch (TwitterException te) {
      println("Couldn't connect: " + te);
  }

  return twitt;
}
