public class Incrementer {
  int x;
  int y;
  int value;
  String name;
  boolean click=true;
  boolean plus=true;
  public Incrementer(String n,int x, int y) {
    this.x=x;
    this.y=y;
    name=n;
    value=1;
  }

  public void display() {
    pushMatrix();
    translate(x, y);
    plus=true;
    mouseCheck();
    circle();
    plus();
    pushMatrix();
    translate(width/16, 0);
    plus=false;
    mouseCheck();
    circle();
    minus();
    popMatrix();
    translate(-width/16, 0);
    textbox();
    translate(-width/32,0);
    title();
    popMatrix();
  }

  public void mouseCheck() {

    if (plus) {
      if (mousePressed&&(pow(pow(mouseX-x, 2)+pow(mouseY-y, 2), 0.5)<width/64&&click)) {
        value+=1;
        click=false;
      } else if (!mousePressed) {
        click=true;
      }
    } else {
      if (mousePressed&&(pow(pow(mouseX-x-width/16, 2)+pow(mouseY-y, 2), 0.5)<width/64&&click)) {
        if(value>1){
        value-=1;
        click=false;
        }else{
          print("No ZEROES!!!");
        }
      } else if (!mousePressed) {
        click=true;
      }
    }
  }

  public void circle() {
    fill(255);
    stroke(0);
    strokeWeight(1);
    ellipseMode(CENTER);
    ellipse(0, 0, width/32, width/32);
  }

  public void plus() {
    fill(0);
    strokeWeight(3);
    line(-width/100, 0, width/100, 0);
    line(0, -width/100, 0, width/100);
  }

  public void minus() {
    fill(0);
    strokeWeight(3);
    line(-width/100, 0, width/100, 0);
  }

  public void textbox() {
    rectMode(CENTER);
    fill(255);
    strokeWeight(3);
    stroke(0);
    rect(0, 0, width/32, width/32);
    textAlign(CENTER, CENTER);
    fill(0);
    noStroke();
    textSize(width/50);
    text(value, 0, 0);
  }
  
  public void title(){
   textAlign(RIGHT,CENTER);
   text(name,0,0); 
  }
  
  public float getValue(){
    return float(value);
  }
}