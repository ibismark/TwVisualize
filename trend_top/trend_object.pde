class Trend{
  
  Trends trends;
  String tname;
  float rank;
  float maxRank;
  
  float degree;
  float r = 1500.0; // radius
  float centerx;    // center point (x, y, z) = (0, 0, 0)
  float centery;
  float centerz;

  float rad;        // sita 

  float x;
  float y;
  float z;

  PVector pos = new PVector(0, 0, 0);
  float offsetx;
  float offsety;
  
  
  Trend(Trends tn, int rank){
      this.trends = tn;
      this.rank = float(rank);
      this.maxRank = float(this.trends.getTrends().length);
      this.tname = trends.getTrends()[rank].getName();
      
      rad = random(0, 2.0*PI);
      x = centerx + (this.rank/100)*r*cos(rad);
      y = centery;
      z = centerz + (this.rank/maxRank)*r*sin(rad);
      pos.set(x, y, z);
  }
  
  
  void update(){
      if(tname == null){
          return;
      } 
      /*
      rad = PI/180.0*degree;//+random(20);
      rad = random(0, 2.0*PI);
      x = centerx + (this.rank/maxRank)*r*cos(rad);
      y = centery;
      z = centerz + (this.rank/maxRank)*r*sin(rad);
      pos = new PVector(x, y, z);
      */
      
      pushMatrix();
          translate(pos.x-100.0, pos.y, pos.z);
          text(this.tname, 0, 0);
      popMatrix();
      
      degree += 1.0;
  }
  

}

