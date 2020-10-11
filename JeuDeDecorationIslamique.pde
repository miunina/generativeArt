PImage img;
int r=0;int couleur;
int symmetry =18;
int angle = 360 / symmetry;
float strokeSize = 2; // use + and - keys to change instead of slider
float xoff;
int blue,red,green;
float[][] noyau = { { 1, 1, 1, 1} , { 1, 1, 1,1 } ,{ 1, 1, 1,1 },{ 1, 1, 1,1 } } ;
int size =3;
 int shape=1;
 void setup()
 {
   size(2048,1152);//2048x1152
   
   
background(25);
 }
 
 int df,dg,pdg,pdf;
int b=0;
void draw()
{

  translate(df, dg);
 
  int mx = mouseX - df;//width / 2;
  int my = mouseY - dg;//height / 2;
  int pmx = pmouseX -pdf;// width / 2;
  int pmy = pmouseY -pdg;// height / 2;
 
  if (mousePressed) { 
    int hu = int(map(mouseX, -1, 1, 0, 255));//int(map(sin(radians(xoff)), -1, 1, 0, 255));
    xoff += 1;
   
    
    if(mouseButton==LEFT)
    {
      green = int(map(mouseX, 0,width, 0, r));//sin(radians(xoff))
     red=int(map(mouseX, 0,width, 0, 255));//int(map(sin(radians(xoff)), -1, 1, 0, 255));
      blue=0;
    }
    if(mouseButton==RIGHT)
    {
     green=int(map(mouseX,0, width, 0, 255));//int(map(sin(radians(xoff)), -1, 1, 0, 255));//*45/100;
     blue=int(map(mouseX, 0, width, 0, r));//int(map(sin(radians(xoff)),-1,1,0,255)); 
     red =0;
    }
    if(couleur==0)
    {fill(color(red,green,blue));}
    else
    {fill(255);
    }
    stroke(color(red,green,blue), 100); 
    for (int i = 0; i < symmetry; i++) {
    rotate(radians(angle));
    
      float sw = strokeSize;
      strokeWeight(sw);
     int h;
     float pmyy = map(pmx,0,width,0,20);
     float pmxx = map(pmy,0,height,10,40);
     if(mx>pmx)h=mx-pmx;
     else h=pmx-mx;
     
    
    if(shape==2)
    {///circle(mx,my,h);
    }
    else{
      if(shape==1)
      ellipse(mx, my, pmxx, pmyy);
      else
      line(mx, my, pmx, pmy);
    }
      pushMatrix();
      scale(1, -1);
       if(shape==2)
    {circle(mx,my,h);
    }
    else{
      if(shape==1)
      ellipse(mx, my, pmxx, pmyy);//      ellipse(mx, my, pmx, pmy);
      else
      line(mx, my, pmx, pmy);
    }
      popMatrix();
    }
  }
}
void keyPressed() {
  if (key == 's' || key == 'S') {
    save("test_result"+b+".png");b++;
    println("test result saved!");
  } else if (key == 'c' || key == 'C') {
    background(255);
  }
   if (key == '+' || key == '=') {
      r= constrain(r+5, 1, 255);
      println("strokeSize is " + strokeSize);
    } else if (key == '-' || key == '_') {
      r = constrain(r-5, 1, 255);
      println("strokeSize is " + strokeSize);
    }
    if(key == 'p' || key=='P')
    {
      if(shape == 2)shape=1;
      else 
      if(shape==1)
      shape=0;
      else shape=2;
    }
}
 void mousePressed()
 {df=mouseX;dg=mouseY;
   pdf=pmouseX;pdg=mouseY;
   if(couleur==0)
   {
     couleur=1;
   }
   else
   couleur=0;
   
 }
 
