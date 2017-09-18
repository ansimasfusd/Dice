Die[] dice;
void setup() {
  dice = new Die[56];
  size(500,550);
  for (int y = 0; y < 8 ; y++){
    for(int x = 0; x < 7; x++){
      dice[y*7 + x] = new Die(50 + 60 * x, 10 + 60 * y);
    }
  }
	noLoop();
}
void draw() {
  int sum = 0;
  background(150);
	for(Die d : dice) {
    d.show();
    sum = sum + d.rollNumber;
  }
  
  stroke(50);
  text("The total sum is:", 100, 530);
  text( sum, 210, 530);
}
void mousePressed(){
  for(Die d : dice) {
    if(mouseX >= d.myX && mouseX <= d.myX+50){
      if(mouseY >= d.myY && mouseY <= d.myY+50){
        d.roll();
      }
    }
  }
	redraw();
}
class Die {
	int myX, myY, rollNumber;
	Die(int x, int y){
    myX = x;
    myY = y;
    roll();
	}
	void roll()
	{
		int number = (int)(Math.random()*6 + 1);
    if (number == 1){
      rollNumber = 1;
    }
    
    else if (number == 2){
      rollNumber = 2;
    }
    else if (number == 3){
      rollNumber = 3;
    }
    else if (number == 4){
      rollNumber = 4;
    }
    else if (number == 5){
      rollNumber = 5;
    }
    else if (number == 6){
      rollNumber = 6;
    }
	}
	void show()
	{
    fill(25,200,150);
		rect(myX, myY, 50, 50);
    fill(0);
    for (int j = 0; j < rollNumber * 8; j+=8)
    {
    ellipse(myX + 5 + j,myY + 5 + j, 3, 3);
    }
	}
}