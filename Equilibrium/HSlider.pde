public class HSlider{
    int x;
    int y;
    String name;
    int px;
    int py;
    boolean clicking=false;
    
   public HSlider(String name,int x,int y){
     this.x=x;
     this.y=y;
     this.name=name;
     px=0;
     py=0;
       
 }
 
   public void display(){
     pushMatrix();
     translate(x,y);
     stroke(200,200);
     strokeWeight(5);
     line(-width/4,0,width/4,0);
     stroke(0);
     line(-width/4-width/80,-width/64-width/100,-width/4+width/80,-width/64-width/100);
     line(width/4-width/80,-width/64-width/100,width/4+width/80,-width/64-width/100);
     
     line(width/4,-width/64-width/100+width/80,width/4,-width/64-width/100-width/80);
     
     //line(width/4,0-width/100,width/4,-width/40-width/100);
     stroke(25);
     strokeWeight(3);
     if(clicking){
       fill(75);
     }else{
       fill(125);
     }
     rectMode(CENTER);
     rect(px,py,width/32,height/16);
     textAlign(RIGHT,CENTER);
     fill(0);
     noStroke();
     textSize(width/50);
     text(name,-width/3.5,0);
     popMatrix();
   }
   
   public void update(){
     mouseCheck();
     if(clicking){
       if(mouseX-x<=width/4){
           if(mouseX-x>=-width/4){
            px=mouseX-x; 
           }else{
            px=-width/4;
           }
       }else{
         px=width/4;
       }
     }
   }
   
   public void mouseCheck(){
     pushMatrix();
     translate(x,y);
     if(mousePressed&&mouseX-x>px-width/16&&mouseX-x<px+width/16&&mouseY-y>py-height/16&&mouseY-y<height/16){
       clicking=true;
     }else{
       clicking=false;
     }
     popMatrix();
   }
   
   public int getPx(){
     return px;   
   }
} 