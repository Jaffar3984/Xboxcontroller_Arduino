import processing.serial.*;

import net.java.games.input.*;
import org.gamecontrolplus.*;
import org.gamecontrolplus.gui.*;

import cc.arduino.*;
import org.firmata.*;

//variables
ControlDevice cont;
ControlIO control;

Arduino arduino;

float thumb;

void setup() {
  size(360,200);
  
  control = ControlIO.getInstance(this);
  cont = control.getMatchedDevice("XboxServo");
  
  if (cont == null) {
    println("Nothing so far Cheif");
    System.exit(-1);
  }
  
  //println(Arduino.list());
  arduino = new Arduino(this, Arduino.list()[0] , 57600);
  arduino.pinMode(10, Arduino.SERVO);
  
}  

public void getUserInput() {
 
  //assign float value
  //access the controller
  thumb = map(cont.getSlider("servoPos").getValue(), -1, 1, 0, 180);
  //println(thumb);
  
}

void draw() {
  getUserInput();
  background(thumb,100,255);
  
  arduino.servoWrite(10,(int)thumb);
  
  
}
  
