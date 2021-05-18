public class CheckBox{
  int x,y;
  String name;
  boolean clicking=false;
  boolean click=false;
  boolean exo=false;
  public CheckBox(String n,int x,int y){
    name=n;
    this.x=x;
    this.y=y;
  }
  
  public void display(){
    pushMatrix();
    translate(x,y);
    checkBox();
    txt();
    popMatrix();
  }
  
  public void update(){
    mouseCheck();
    
  }
  
  public void mouseCheck(){
    if(!clicking&&mousePressed&&mouseX-x>-width/16&&mouseX-x<width/16&&mouseY-y>-width/16&&mouseY-y<width/16){
       clicking=true;
       if(exo){
        exo=false;
      }else{
        exo=true;
      }
    }else if(!mousePressed){
      clicking=false;
    }
  }
  
  public void checkBox(){
   rectMode(CENTER);
    fill(255);
    strokeWeight(3);
    stroke(0);
    rect(0,0,width/32, width/32);
    textAlign(CENTER, CENTER);
    fill(0);
    noStroke();
    textSize(width/50);
    if(exo){
    text("X", 0, 0);
    }
  }
  
  public void txt(){
   text("Exo:",-width/20,0); 
  }
  
  public boolean getExo(){
   return exo; 
  }
}