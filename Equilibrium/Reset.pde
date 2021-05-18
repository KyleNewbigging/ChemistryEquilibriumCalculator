public class Reset{
    int x;
    int y;
    boolean mouseCollide=false;
    
    public Reset(int x, int y){
      this.x=x;
      this.y=y;
    }
    
    public void display(){
        pushMatrix();
        translate(x,y);
        println(mouseY-y);
        fill(100);
        stroke(0);
        strokeWeight(3);
        rectMode(CENTER);
        rect(0,0,width/16,width/16);
        textAlign(CENTER);
        fill(0);
        textSize(width/64);
        text("Set Eq",0,0);
        popMatrix();
    }
    public void update(Scale s){
      check(s);
    }
    
    public void check(Scale s){
      if(mousePressed&&mouseX-x>-width/32&&mouseX-x<width/32&&mouseY-y>-width/32&mouseY-y<width/32){
        println("collision");
        s.setReset();
      }
    }
    
    public void mouseCheck(){
      
    }
}