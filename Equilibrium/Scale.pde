 public class Scale {
   float a; 
   int x;
   int y;
   float reset;
   float adjustor;
   String text;
  public Scale(int x, int y){
    a=-20;// angle constant
    this.x=x; //  reference point x
    this.y=y; //  and y
    reset=0;
  }
  
  public void display(){
    pushMatrix();
    translate(x,y);
    base();
    beam();
    popMatrix();
    
    
  }
  
  public void update(){
    
    if(l.getValue()>r.getValue()){
      if(c.getExo()){
         adjustor = p.getPx()-t.getPx();
      }else{
        adjustor = p.getPx()+t.getPx();
      }
    }else if(l.getValue()==r.getValue()){
      if(c.getExo()){
        adjustor=-t.getPx();
      }else{
        adjustor=t.getPx();
      }
    }else{
      if(c.getExo()){
       adjustor = -p.getPx()-t.getPx(); 
      }else{
        adjustor = -p.getPx()+t.getPx();
      }
    }
    a=map(adjustor-reset,-width/3,width/3,-30,30);
    
   
    
  }
  
  public void base(){
    fill(0);
    ellipseMode(CENTER);
    //ellipse(0,height/2,width/3,height/8);
    noStroke();
    arc(0,height/2,width/3,height/8,PI, TWO_PI);
    stroke(0);
    strokeWeight(width/50);
    line(0,height*7/15,0,0);
    ellipse(0,0,width/50,width/50);
    if(a>3){
      text="Shifts Right";
    }else if(a<-3){
      text="Shifts Left";
    }else{
      text="@ Equilibrium";
    }
    textSize(width/20);
    text(text,0,height/1.65);
  }
  
  public void beam(){
    strokeWeight(15);
    fill(0);
    turn(a);
    line(0,0,width/5,0);
    line(0,0,-width/5,0);
    pushMatrix();
    translate(width/5,0);
    turn(-a);
    platform();
    turn(a);
    translate(-(width/5*2),0);
    turn(-a);
    platform();
    popMatrix();
    
    
  }
  public void platform(){
    strokeWeight(10);
    line(-width/20,height/5,width/20,height/5);
    strokeWeight(3);
    line(0,0,-width/20,height/5);
    line(0,0,width/20,height/5);
  }
  
  public void turn(float degrees){
     rotate(degrees/57.2958);
  }
  
  public void setA(float a){
    this.a=a;
  }
  public void setReset(){
   reset=adjustor; 
  }
}