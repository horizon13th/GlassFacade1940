int smallRectwidth = 30;
int widthNum = 22;
int heightNum = 16;
int width = (widthNum+2) * smallRectwidth;
int height = (heightNum+1) * smallRectwidth;
float segX = 2;
float segY = 2;
color tempColor = color(0,0,0);
color[] cArray = new color[7];
float[][] pointMapX = new float[widthNum][heightNum];
float[][] pointMapY = new float[widthNum][heightNum];
boolean [][] pointFlagOfBigRect = new boolean[widthNum][heightNum];
boolean [][] pointFlagOfMidVRect = new boolean[widthNum][heightNum];
boolean [][] pointFlagOfMidHRect = new boolean[widthNum][heightNum];

void setup(){
  size(width,height);
  colorMode(HSB,360,100,100);
  iniPointMap();
}

void draw(){
  iniColor();
  background(cArray[0]);
  //pepperbg();
  noLoop();
  noFill();    
  iniFlag();
  //drawPoint();
  arcEdgeBackground();
  drawSmallRect();
  triangleComb(6,3,19,5);  
  oneComb(5,1);
  ladderComb(3,6,5,11,9,10,13,11);
  drawBigRect();  
  drawMidHRect();
  drawMidVRect();
  arcEdgeForeground();
   //drawForeGroundNoise(7);
  //noStroke();
}
  
void mousePressed() {
  loop();  // Holding down the mouse activates looping
  //saveFrame("glassFacade1940-######.png");
}

void mouseReleased() {
  noLoop();  // Releasing the mouse stops looping draw()
}

void iniColor(){
  cArray[0] = color(5,20,35);//background
  cArray[1] = color(5,75,95);//red
  cArray[2] = color(5,65,100);//meat red
  cArray[3] = color(15,70,90);//orange
  cArray[4] = color(145,35,60);//green
  cArray[5] = color(250,20,50);//navy
  cArray[6] = color(220,60,60);//blue
  
}

void iniPointMap(){
  for (int i=0;i<widthNum;i++){
  for (int j=0;j<heightNum;j++){
    pointMapX[i][j] = random(smallRectwidth*(i+1)-segX,smallRectwidth*(i+1)+segX);
    pointMapY[i][j] = random(smallRectwidth*(j+1)-segY,smallRectwidth*(j+1)+segY);
    //print("\n point"+i+j+":"+pointMapX[i][j]+" "+pointMapY[i][j]);
  }
  }
  //int index1 = int(pointMapY.length);
  //int index2 = int(pointMapY[0].length);
  //print(index1+" "+index2);
}

void drawPoint(){
  for (int i=0;i<widthNum;i++){
  for (int j=0;j<heightNum;j++){
    point(pointMapX[i][j], pointMapY[i][j]);
  }
  }
}

void drawSmallRect(){
  //noStroke();
  strokeWeight(3);
  for (int i=1;i<widthNum-1;i++){
  for (int j=1;j<heightNum-1;j++){
    tempColor=cArray[int(random(1,7))];
    fill(tempColor);
    beginShape();
    vertex(pointMapX[i][j],pointMapY[i][j]);
    vertex(pointMapX[i+1][j],pointMapY[i+1][j]);
    vertex(pointMapX[i+1][j+1],pointMapY[i+1][j+1]);
    vertex(pointMapX[i][j+1],pointMapY[i][j+1]);
    vertex(pointMapX[i][j],pointMapY[i][j]);
    endShape();
    pepperNoise(tempColor,pointMapX[i][j],pointMapY[i][j],smallRectwidth,smallRectwidth);
 
  }
  }
}

void drawBigRect(){
  int[][] bigRect = new int[80][3];
  strokeWeight(3);  
  for(int i=0; i<80; i++){
    bigRect[i][0] = i;
    bigRect[i][1] = int(random(1,pointMapX.length-2));
    bigRect[i][2] = int(random(1,pointMapX[0].length-2));
    //printArray(bigRect[i]);
    int x =  bigRect[i][1];
    int y =  bigRect[i][2];
    //print("\n"+x+","+y+":"+pointFlagOfBigRect[x][y]);  
    if(pointFlagOfBigRect[x][y]==false){
      flagBigRect(x,y);
      tempColor=cArray[int(random(1,7))];
      fill(tempColor);      
      beginShape();
        vertex(pointMapX[x][y],pointMapY[x][y]);
        vertex(pointMapX[x+2][y],pointMapY[x+2][y]);
        vertex(pointMapX[x+2][y+2],pointMapY[x+2][y+2]);
        vertex(pointMapX[x][y+2],pointMapY[x][y+2]);
        vertex(pointMapX[x][y],pointMapY[x][y]);
      endShape();
      pepperNoise(tempColor,pointMapX[x][y],pointMapY[x][y],smallRectwidth*2,smallRectwidth*2);
  }}}

void drawMidHRect(){  
  int [][] midRectH = new int[150][3];
  strokeWeight(3);
  for(int i=0; i<150; i++){
    midRectH[i][0] = i;
    midRectH[i][1] = int(random(1,pointMapX.length-1));
    midRectH[i][2] = int(random(1,pointMapX[0].length-2));    
    int x=midRectH[i][1];
    int y=midRectH[i][2];
    if(pointFlagOfMidHRect[x][y]==false){
      tempColor=cArray[int(random(1,7))];
       fill(tempColor);
       beginShape();
         vertex(pointMapX[x][y],pointMapY[x][y]);
         vertex(pointMapX[x+1][y],pointMapY[x+1][y]);
         vertex(pointMapX[x+1][y+2],pointMapY[x+1][y+2]);
         vertex(pointMapX[x][y+2],pointMapY[x][y+2]);
         vertex(pointMapX[x][y],pointMapY[x][y]);
       endShape();
       pepperNoise(tempColor,pointMapX[x][y],pointMapY[x][y],smallRectwidth,smallRectwidth*2);
   }}
}

void drawMidVRect(){  
  int [][] midRectV = new int[30][3];
  strokeWeight(3);
  for(int i=0; i<30; i++){
    midRectV[i][0] = i;
    midRectV[i][1] = int(random(1,pointMapX.length-2));
    midRectV[i][2] = int(random(1,pointMapX[0].length-1));    
    int x=midRectV[i][1];
    int y=midRectV[i][2];
    if(pointFlagOfMidVRect[x][y]==false){
       tempColor=cArray[int(random(1,7))];
       fill(tempColor);
       beginShape();
         vertex(pointMapX[x][y],pointMapY[x][y]);
         vertex(pointMapX[x+2][y],pointMapY[x+2][y]);
         vertex(pointMapX[x+2][y+1],pointMapY[x+2][y+1]);
         vertex(pointMapX[x][y+1],pointMapY[x][y+1]);
         vertex(pointMapX[x][y],pointMapY[x][y]);
       endShape();
       pepperNoise(tempColor,pointMapX[x][y],pointMapY[x][y],smallRectwidth*2,smallRectwidth);
   }}
}

void iniFlag(){
 for(int i=0; i<pointFlagOfBigRect.length;i++){
   for(int j=0; j<pointFlagOfBigRect[0].length;j++){
     pointFlagOfBigRect[i][j]=false;
     pointFlagOfMidVRect[i][j]=false;
     pointFlagOfMidHRect[i][j]=false;
   }}  
}

void flagBigRect(int x, int y){
  for(int i=(x-1);i<=(x+1);i++){
    for(int j=(y-1);j<=(y+1);j++){
      pointFlagOfBigRect[i][j]=true;}}
  for(int i=(x-1);i<=(x+1);i++){
    for(int j=y;j<=(y+1);j++){
      pointFlagOfMidVRect[i][j]=true;}}
  for(int i=x;i<=(x+1);i++){
    for(int j=(y-1);j<=(y+1);j++){
      pointFlagOfMidHRect[i][j]=true;}}
}

void flagLongRect(int x, int y){
  for(int i=(x-1);i<=(x+1);i++){
    for(int j=(y-1);j<=(y+2);j++){
      pointFlagOfBigRect[i][j]=true;}}
  for(int i=(x-1);i<=(x+1);i++){
    for(int j=y;j<=(y+2);j++){
      pointFlagOfMidVRect[i][j]=true;}}
  for(int i=x;i<=(x+1);i++){
    for(int j=(y-1);j<=(y+2);j++){
      pointFlagOfMidHRect[i][j]=true;}}
}

void triangleComb(int x, int y,int x2, int y2){
  fill(cArray[4]);
  triangle(pointMapX[x][y],pointMapY[x][y],pointMapX[x+2][y],pointMapY[x+2][y],pointMapX[x][y+2],pointMapY[x][y+2]);
  pepperSlope(cArray[4],pointMapX[x+2][y],pointMapY[x+2][y],pointMapX[x][y+2],pointMapY[x][y+2],2);
  fill(cArray[1]);
  triangle(pointMapX[x+2][y],pointMapY[x+2][y],pointMapX[x+2][y+2],pointMapY[x+2][y+2],pointMapX[x][y+2],pointMapY[x][y+2]);
  pepperSlope(cArray[1],pointMapX[x+2][y],pointMapY[x+2][y],pointMapX[x][y+2],pointMapY[x][y+2],4);
  fill(cArray[6]);
  triangle(pointMapX[x2][y2],pointMapY[x2][y2],pointMapX[x2+2][y2],pointMapY[x2+2][y2],pointMapX[x2][y2+3],pointMapY[x2][y2+3]);
  pepperSlope(cArray[6],pointMapX[x2+2][y2],pointMapY[x2+2][y2],pointMapX[x2][y2+3],pointMapY[x2][y2+3],2);
  fill(cArray[1]);
  triangle(pointMapX[x2+2][y2],pointMapY[x2+2][y2],pointMapX[x2+2][y2+3],pointMapY[x2+2][y2+3],pointMapX[x2][y2+3],pointMapY[x2][y2+3]);
  pepperSlope(cArray[1],pointMapX[x2+2][y2],pointMapY[x2+2][y2],pointMapX[x2][y2+3],pointMapY[x2][y2+3],4);
  flagBigRect(x,y);
  flagLongRect(x2,y2);
}  

void oneComb(int x, int y){
  fill(cArray[6]);
  triangle(pointMapX[x][y],pointMapY[x][y],pointMapX[x+1][y],pointMapY[x+1][y],pointMapX[x+1][y+1],pointMapY[x+1][y+1]);
  pepperSlope(cArray[6],pointMapX[x][y],pointMapY[x][y],pointMapX[x+1][y+1],pointMapY[x+1][y+1],1);
  fill(cArray[1]);
  beginShape();
     vertex(pointMapX[x][y],pointMapY[x][y]);
     vertex(pointMapX[x+1][y+1],pointMapY[x+1][y+1]);
     vertex(pointMapX[x+1][y+2],pointMapY[x+1][y+2]);
     vertex(pointMapX[x][y+2],pointMapY[x][y+2]);
     vertex(pointMapX[x][y],pointMapY[x][y]);
  endShape();
  pepperSlope(cArray[1],pointMapX[x][y],pointMapY[x][y],pointMapX[x+1][y+1],pointMapY[x+1][y+1],3);  
  pepperNoise(cArray[1],pointMapX[x][y+1],pointMapY[x][y+1],smallRectwidth,smallRectwidth);
  flagBigRect(x,y);
}

void ladderComb(int x0, int y0, int x1, int y1, int x2,int y2,int x3, int y3){
  fill(cArray[6]);
  beginShape();
     vertex(pointMapX[x0][y0],pointMapY[x0][y0]);
     vertex(pointMapX[x0+2][y0],pointMapY[x0+2][y0]);
     vertex(pointMapX[x0+2][y0+3],pointMapY[x0+2][y0+3]);
     vertex(pointMapX[x0][y0+1],pointMapY[x0][y0+1]);
     vertex(pointMapX[x0][y0],pointMapY[x0][y0]);
  endShape();
  pepperNoise(cArray[6],pointMapX[x0][y0],pointMapY[x0][y0],smallRectwidth*2,smallRectwidth);
  pepperSlope(cArray[6],pointMapX[x0][y0+1],pointMapY[x0][y0+1],pointMapX[x0+2][y0+3],pointMapY[x0+2][y0+3],1);
  fill(cArray[1]);
  triangle(pointMapX[x0][y0+1],pointMapY[x0][y0+1],pointMapX[x0+2][y0+3],pointMapY[x0+2][y0+3],pointMapX[x0][y0+3],pointMapY[x0][y0+3]);
  pepperSlope(cArray[1],pointMapX[x0][y0+1],pointMapY[x0][y0+1],pointMapX[x0+2][y0+3],pointMapY[x0+2][y0+3],3);
  
  fill(cArray[6]);
  beginShape();
     vertex(pointMapX[x1][y1],pointMapY[x1][y1]);
     vertex(pointMapX[x1+2][y1],pointMapY[x1+2][y1]);
     vertex(pointMapX[x1+2][y1+3],pointMapY[x1+2][y1+3]);
     vertex(pointMapX[x1][y1+1],pointMapY[x1][y1+1]);
     vertex(pointMapX[x1][y1],pointMapY[x1][y1]);
  endShape();
  pepperNoise(cArray[6],pointMapX[x1][y1],pointMapY[x1][y1],smallRectwidth*2,smallRectwidth);
  pepperSlope(cArray[6],pointMapX[x1][y1+1],pointMapY[x1][y1+1],pointMapX[x1+2][y0+3],pointMapY[x1+2][y1+3],1);
  fill(cArray[1]);
  triangle(pointMapX[x1][y1+1],pointMapY[x1][y1+1],pointMapX[x1+2][y1+3],pointMapY[x1+2][y1+3],pointMapX[x1][y1+3],pointMapY[x1][y1+3]);
  pepperSlope(cArray[1],pointMapX[x1][y1+1],pointMapY[x1][y1+1],pointMapX[x1+2][y1+3],pointMapY[x1+2][y1+3],3);
  
  fill(cArray[4]);
  beginShape();
     vertex(pointMapX[x2][y2],pointMapY[x2][y2]);
     vertex(pointMapX[x2+2][y2],pointMapY[x2+2][y2]);
     vertex(pointMapX[x2+2][y2+1],pointMapY[x2+2][y2+1]);
     vertex(pointMapX[x2][y2+3],pointMapY[x2][y2+3]);
     vertex(pointMapX[x2][y2],pointMapY[x2][y2]);
  endShape();
  pepperNoise(cArray[4],pointMapX[x2][y2],pointMapY[x2][y2],smallRectwidth*2,smallRectwidth);
  pepperSlope(cArray[4],pointMapX[x2+2][y2+1],pointMapY[x2+2][y2+1],pointMapX[x2][y2+3],pointMapY[x2][y2+3],2);  
  fill(cArray[1]);
  triangle(pointMapX[x2+2][y2+1],pointMapY[x2+2][y2+1],pointMapX[x2+2][y2+3],pointMapY[x2+2][y2+3],pointMapX[x2][y2+3],pointMapY[x2][y2+3]);
  pepperSlope(cArray[1],pointMapX[x2+2][y2+1],pointMapY[x2+2][y2+1],pointMapX[x2][y2+3],pointMapY[x2][y2+3],4);    
  
  fill(cArray[4]);
  beginShape();
     vertex(pointMapX[x3][y3],pointMapY[x3][y3]);
     vertex(pointMapX[x3+2][y3],pointMapY[x3+2][y3]);
     vertex(pointMapX[x3+2][y3+3],pointMapY[x3+2][y3+3]);
     vertex(pointMapX[x3][y3+1],pointMapY[x3][y3+1]);
     vertex(pointMapX[x3][y3],pointMapY[x3][y3]);
  endShape();
  pepperNoise(cArray[4],pointMapX[x3][y3],pointMapY[x3][y3],smallRectwidth*2,smallRectwidth);
  pepperSlope(cArray[4],pointMapX[x3][y3+1],pointMapY[x3][y3+1],pointMapX[x3+2][y3+3],pointMapY[x3+2][y3+3],1);
  fill(cArray[1]);
  triangle(pointMapX[x3][y3+1],pointMapY[x3][y3+1],pointMapX[x3+2][y3+3],pointMapY[x3+2][y3+3],pointMapX[x3][y3+3],pointMapY[x3][y3+3]);
  pepperSlope(cArray[1],pointMapX[x3][y3+1],pointMapY[x3][y3+1],pointMapX[x3+2][y3+3],pointMapY[x3+2][y3+3],3);
 
  flagLongRect(x0,y0);
  flagLongRect(x1,y1);
  flagLongRect(x2,y2);
  flagLongRect(x3,y3);
}

void arcEdgeBackground(){
  fill(cArray[1]);
  strokeWeight(3);
  
  //left-bottom
  beginShape();
    vertex(pointMapX[1][6],pointMapY[1][6]);
    vertex(pointMapX[1][14],pointMapY[1][14]);
    vertex(pointMapX[0][14],pointMapY[0][14]);
    quadraticVertex(pointMapX[0][10],pointMapY[0][10],pointMapX[1][6],pointMapY[1][6]);
  endShape();
  pepperSlope(cArray[1],pointMapX[1][6],pointMapY[1][6],pointMapX[0][14],pointMapY[0][14],4);
  
  //top-left
  beginShape();
    vertex(pointMapX[2][1],pointMapY[2][1]);
    vertex(pointMapX[2][0],pointMapY[2][0]);
    quadraticVertex(pointMapX[3][0],pointMapY[3][0],pointMapX[4][0],pointMapY[4][0]);
    quadraticVertex(pointMapX[5][0],pointMapY[5][0],pointMapX[6][1],pointMapY[6][1]);
  endShape();
  pepperNoise(cArray[1],pointMapX[2][0],pointMapY[2][0],smallRectwidth*2,smallRectwidth);
  pepperSlope(cArray[1],pointMapX[4][0],pointMapY[4][0],pointMapX[6][1],pointMapY[6][1],3);
  
  //top-right long
  beginShape();
    vertex(pointMapX[8][1],pointMapY[8][1]);
    vertex(pointMapX[21][2],pointMapY[21][2]);
    quadraticVertex(pointMapX[21][1],pointMapY[21][1],pointMapX[20][0],pointMapY[20][0]);
    quadraticVertex(pointMapX[15][0],pointMapY[15][0],pointMapX[8][1],pointMapY[8][1]);
  endShape();
  pepperSlope(cArray[1],pointMapX[20][0],pointMapY[20][0],pointMapX[8][1],pointMapY[8][1],4);
  
  //right-bottom
  beginShape();
    vertex(pointMapX[21][4],pointMapY[21][4]);
    vertex(pointMapX[21][15],pointMapY[21][15]);
    vertex(pointMapX[21][15]+smallRectwidth,pointMapY[21][15]);
    quadraticVertex(pointMapX[21][14]+smallRectwidth,pointMapY[21][14],pointMapX[21][13]+smallRectwidth,pointMapY[21][13]);
    quadraticVertex(pointMapX[21][10]+smallRectwidth,pointMapY[21][10],pointMapX[21][4],pointMapY[21][4]);     
  endShape();
  pepperSlope(cArray[1],pointMapX[21][4],pointMapY[21][4],pointMapX[21][15]+smallRectwidth,pointMapY[21][15],3);
}

void arcEdgeForeground(){
  fill(cArray[1]);
  triangle((pointMapX[20][1]+pointMapX[21][1])*0.5,(pointMapY[21][0]+pointMapY[21][1])*0.5,(pointMapX[20][1]+pointMapX[21][1])*0.5+smallRectwidth,(pointMapY[21][0]+pointMapY[21][1])*0.5,pointMapX[21][4],pointMapY[21][4]);
  pepperSlope(cArray[1],pointMapX[20][1]+smallRectwidth*0.7,(pointMapY[21][0]+pointMapY[21][1])*0.5,pointMapX[21][4],pointMapY[21][4],1);
  pepperSlope(cArray[1],pointMapX[20][1]+smallRectwidth*1.2,(pointMapY[21][0]+pointMapY[21][1])*0.5,pointMapX[21][4],pointMapY[21][4],2);
}
color colorChangeHSB(color iniColor,float segH,float segS,float segB){
  float h,s,b,h1,s1,b1;
  h=hue(iniColor);
  s=saturation(iniColor);
  b=brightness(iniColor);
  h1=int(random(h-segH,h+segH));
  s1=int(random(s-segS,s+segS));
  b1=int(random(b-segB,b+segB));
  //print("r1"+r1+"g1"+g1+"b1"+b1);
  return color(h1,s1,b1);  
}

void drawForeGroundNoise(int transparency)
{
  float xnoise = 0.0;
  float ynoise = 0.0;
  float inc = 0.04;
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      float gray = noise(xnoise, ynoise) *255;
      stroke(gray, transparency);
      point(x, y); 
      xnoise = xnoise + inc;
    }
    xnoise = 0;
    ynoise = ynoise + inc;
  }
}

void pepperNoise(color iniColor, float x0, float y0, float noiseRectWidth, float noiseRectHeight){
  for(int i=0; i<500;i++)
  {
    stroke(colorChangeHSB(iniColor,5,5,5));
    strokeWeight(2);
    point(random(x0+2*segX,x0+noiseRectWidth-2*segX),random(y0+2*segY,y0+noiseRectHeight-2*segY));
  }
  strokeWeight(3);
    stroke(0,0,0);
}

void pepperbg(){
  color iniColor = cArray[0];
  for(int i=0; i<width;i++){
    for(int j=0; j<height;j++){
    stroke(colorChangeHSB(iniColor,5,5,5));
    strokeWeight(2);
    point(random(0,width),random(0,height));
  }
  }
  strokeWeight(3);
  stroke(0,0,0);
}

void pepperSlope(color iniColor, float x0, float y0, float x1, float y1, int quadrant){
  float x=0;
  float y=0;
  for(int i=0; i<500; i++){
  stroke(0,0,0);
  stroke(colorChangeHSB(iniColor,5,5,5));
  //strokeWeight(2);
  if(x0<x1)
  {x = random(x0+2*segX,x1-2*segY);}
  if(x0>x1)
  {x = random(x1+2*segX,x0-2*segY);}
  if(y0<y1)
  {y = random(y0+2*segX,y1-3*segY);}
  if(y0>y1)
  {y = random(y1+2*segX,y0-3*segY);}
  if(quadrant==1){ 
    if(y<slopeCaly(x,x0,y0,x1,y1)-segX)
    {point(x,y);}
  }  
  if(quadrant==2){
    if(y<slopeCaly(x,x0,y0,x1,y1)-segX)
    {point(x,y);}     
  } 
  if(quadrant==3){
    if(y>slopeCaly(x,x0,y0,x1,y1)+2*segX)
    {point(x,y);}     
  }
  if(quadrant==4){
    if(y>slopeCaly(x,x0,y0,x1,y1)+2*segX)
    {point(x,y);}     
  }
  }
  strokeWeight(3);
  stroke(0,0,0);
}   
    
float slopeCaly(float x, float x0, float y0, float x1, float y1) {
  float y;
  y = (y0-y1)/(x0-x1)*(x-x1)+y1;
  return y;
}
