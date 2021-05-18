int menu=0;
Scale s;
HSlider p;
HSlider t;
Incrementer l;
Incrementer r;
CheckBox c;
Reset reset;
void setup(){
  //size(1000,500);
  //size(800,600);
  fullScreen();
  s = new Scale(width/3,height/3);
  p = new HSlider("Pressure:",width/3*2,height/5);
  t = new HSlider("Temperature:",width/3*2,height/12);
  l = new Incrementer("Left:",width/5*4,height/3);
  r = new Incrementer("Right:",width/5*4,height/2);
  c = new CheckBox("Exo?",width/5*4,height/3*2);
  reset = new Reset(width/16,width/16);
}

void draw(){
  if(menu==0){
    background(220,75,125);
    if(mouseX>width/2-width/3/2&&mouseX<width/2+width/3/2&&mouseY>height/3*2-height/5/2&&mouseY<height/3*2+height/5/2){
      stroke(0);
      fill(50,255,50);
      rectMode(CENTER);
      strokeWeight(width/150);
      rect(width/2,height/3*2,width/3,height/5);
      if(mousePressed){
      menu=1;
      }
    }else{
      stroke(50);
      fill(60,225,60);
      rectMode(CENTER);
      strokeWeight(width/150);
      rect(width/2,height/3*2,width/3,height/5);
    }
    
    
    textSize(width/12);
    textAlign(CENTER);
    fill(0);
    strokeWeight(width/250);
    text("Equilibrium Calculator",width/2,height/3);
    
    text("Start",width/2,height/3*2.16);
    
    
  }else if(menu==1){
    background(220,75,125);
    p.display();
    p.update();
    t.display();
    t.update();
    l.display();
    r.display();
    c.update();
    c.display();
    reset.update(s);
    reset.display();
    s.update();
    s.display();
  }
    
}