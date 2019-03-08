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
float lThumb;

void setup() {
  size(360,200);
  
  control = ControlIO.getInstance(this);
  cont = control.getMatchedDevice("XboxServoLRX");
  
  if (cont == null) {
    println("Nothing so far Cheif");
    System.exit(-1);
  }
  
  //println(Arduino.list());
  arduino = new Arduino(this, Arduino.list()[0] , 57600);
  arduino.pinMode(10, Arduino.SERVO);
  arduino.pinMode(9, Arduino.SERVO);
  
}  

public void getUserInput() {
 
  //assign float value
  //access the controller
  thumb = map(cont.getSlider("servoPos").getValue(), -1, 1, 0, 180);
  lThumb = map(cont.getSlider("bigServoPod").getValue(), -1, 1, 0, 180);
  //println(thumb);
  
}

void draw() {
  getUserInput();
  background(thumb,100,lThumb);
  
  arduino.servoWrite(10,(int)thumb);
  arduino.servoWrite(9,(int)lThumb);
  
  
}
  
