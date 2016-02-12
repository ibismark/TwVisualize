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
  
  float fontSize;
  
  
  
  Trend(Trends tn, int rank){
      trends = tn;
      this.rank = float(rank);
      maxRank = float(this.trends.getTrends().length);
      tname = trends.getTrends()[rank].getName();
      
      //initial position
      rad = random(0, 2.0*PI);
      x = centerx + (this.rank/100)*r*cos(rad);
      y = centery;
      z = centerz + (this.rank/maxRank)*r*sin(rad);
      pos.set(x, y, z);
      
      //high rank -> big size,  low rank -> small size
      fontSize = (1 - (this.rank/maxRank*2)) * (maxRank - this.rank) + 5;
  }
  
  
  
  PVector getPos(){
      return pos; 
  }
  
  
  
  void update(){
      if(tname == null){
          return;
      } 
      
      
      pushMatrix();
          translate(pos.x-100.0, pos.y, pos.z);
          PMatrix3D mm = (PMatrix3D)g.getMatrix();  
          // to matrix E  
          mm.m00 = mm.m11 = mm.m22 = 1;  
          mm.m01 = mm.m02 =   
          mm.m10 = mm.m12 =   
          mm.m20 = mm.m21 = 0;  
          resetMatrix();  
          applyMatrix(mm);
          
          textFont(font, fontSize);
          text(this.tname, 0, 0);
      popMatrix();
      

      x = centerx + (this.rank/maxRank)*r*cos(rad+PI/180.0*degree);
      y = centery;
      z = centerz + (this.rank/maxRank)*r*sin(rad+PI/180.0*degree);
      pos.set(x, y, z);
      
      
      degree += 1.0;
  }
  

}

