import geomerative.*;
PGraphics pg;
PImage img;
 
 //pattern
RShape grp;
RPoint[][] pointPaths;

float xmag, ymag, newYmag, newXmag = 0;
float z = 0;

boolean ignoringStyles = false;


//for scale
float a = 0.0;

void setup(){
  size(1000, 1000, P3D);
  pg = createGraphics(1000,1000);
  size(1366, 768);
  img = loadImage("bg2.jpg");
  
  
  RG.init(this);
  RG.ignoreStyles(ignoringStyles);
  
  RG.setPolygonizer(RG.ADAPTATIVE);


  grp = RG.loadShape("gbb.svg");
  grp.centerIn(g, 110, 1, 1);
  
  pointPaths = grp.getPointsInPaths();
}


void mouseMoved(){
  noCursor();
}

    
void draw(){
  translate(width/2, height/2);
  background(img);
  
  //scale
 // a = a + 0.013;
  
  newXmag = mouseX/float(width) * TWO_PI;
  newYmag = mouseY/float(height) * PI * 3;
  
  float diff = xmag-newXmag;
  if (abs(diff) >  0.01) { xmag -= diff/100.0; }
  
  diff = ymag-newYmag;
  if (abs(diff) >  0.01) { ymag -= diff/100.0; }
  
  rotateX(ymag); 
  rotateY(-xmag); 
  
  
fill(#FFE9967A);
//stroke(255,248,10);
stroke(255);
stroke(#FFE9967A);
strokeWeight(2.20);

  directionalLight(126, 126, 126, 0, 0, -1);
ambientLight(255,255,255);
 
 float newMouseY = map(mouseY,0,1000,0,100);
 println(newMouseY);
  
  z = 1 * sin( newMouseY/500.0 * PI* 3.5);
  
  
  
  for(int i = 0; i<pointPaths.length; i++){
    translate(0,0,z);

    
    if(mouseX > displayWidth/2){
      if (pointPaths[i] != null) {
        pg.beginShape(POINTS);
        for(int j = 0; j<pointPaths[i].length; j++){
          vertex(pointPaths[i][j].x, pointPaths[i][j].y);
          if(mouseX > 500){
stroke(#FFCC99);
                  vertex(pointPaths[i][j].x, pointPaths[i][j].y);
                   stroke(255);
                  vertex(pointPaths[i][j].x+10, pointPaths[i][j].y+10);

                  
  
          }
        }
        pg.endShape();
        
      }
    }
    
    if (mouseX < displayWidth/2){
    if (pointPaths[i] != null) {
        beginShape(POINTS);
        for(int j = 0; j<pointPaths[i].length; j++){
          vertex(pointPaths[i][j].x, pointPaths[i][j].y);
          if(mouseX < displayWidth/2){
stroke(#FF6633);
                  vertex(pointPaths[i][j].x, pointPaths[i][j].y);
                  
                  stroke(255);
                  vertex(pointPaths[i][j].x+2, pointPaths[i][j].y+2);

                  
                  

  
          }
        }
        endShape();
        
    }
     
    }
    
  
  
  }
}
