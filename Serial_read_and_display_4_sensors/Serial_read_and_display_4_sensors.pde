
// Graphing sketch


// This program takes ASCII-encoded strings
// from the serial port at 9600 baud and graphs them. It expects values in the
// range 0 to 1023, followed by a newline, or newline and carriage return

// Created 20 Apr 2005
// Updated 24 Nov 2015
// by Tom Igoe
// This example code is in the public domain.

import processing.serial.*;
PrintWriter txt;
import java.util.Locale;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;


Serial myPort;        // The serial port
int xPos = 1;         // horizontal position of the graph
int oneV = 0;
int subject = 1;
float inByte1 = 0;
float prevInByte1 = 0;
float inByte2 = 0;
float prevInByte2 = 0;
float inByte3 = 0;
float prevInByte3 = 0;
float inByte4 = 0;
float prevInByte4 = 0;
String[] list = {
  "666", "100", "400", "600", "800", "1000", "666"
};
String inString = "666, 100,400,600,800,1000,666";
long frameNum=0;


void setup () {
  // set the window size:
  size(1000, 300);
  oneV = height/5;
  // List all the available serial ports
  // if using Processing 2.1 or later, use Serial.printArray()
  println(Serial.list());
  // I know that the first port in the serial list-+  on my mac
  // is always my  Arduino, so I open Serial.list()[0].
  // Open whatever port is the one you're using.
  myPort = new Serial(this, Serial.list()[0], 250000);

  // don't generate a serialEvent() unless you get a newline character:
  myPort.bufferUntil('\n');
  // set inital background:
  background(0);
  //txt = createWriter("/media/solemaker/SOS/PressData/PressureSample" + year() + month() + day() + hour() + minute()+".csv"); 
  txt = createWriter("/Users/troy/Google Drive/TUe/Insights into Expirimental Data/Challenge2-IIED/Challenge2-IIED/" + year() + month() + day() + hour() + minute()+".csv");
  txt.println("Arduino Time, " + "Sensor 1, " + "Sensor 2, " + "Sensor 3, " + "Sensor 4, " + "Processing Time, " + "Frame #");
}

void draw () {
  // draw the line:
  list = split(inString, ',');
  // convert to an int and map to the screen height:

  inByte1 = float(list[1]);
  //inByte1 = constrain(inByte1, prevInByte2 - 30, prevInByte2 + 30);
  prevInByte1 = inByte1;
  inByte1 = map(inByte1, 0, 1023, 0, height);
  stroke(127, 34, 255);
  line(xPos, (height-inByte1)-2, xPos, height - inByte1);//graph  

  inByte2 = float(list[2]);
  inByte2 = constrain(inByte2, prevInByte2 - 30, prevInByte2 + 30);
  prevInByte2 = inByte2;
  inByte2 = map(inByte2, 0, 1023, 0, height);
  stroke(34, 127, 255);
  line(xPos, (height-inByte2)-2, xPos, height - inByte2);//graph

  inByte3 = float(list[3]);
  //inByte1 = constrain(inByte1, prevInByte2 - 30, prevInByte2 + 30);
  prevInByte3 = inByte3;
  inByte3 = map(inByte3, 0, 1023, 0, height);
  stroke(127, 255, 34);
  line(xPos, (height-inByte3)-2, xPos, height - inByte3);//graph  

  inByte4 = float(list[4]);
  //inByte1 = constrain(inByte1, prevInByte2 - 30, prevInByte2 + 30);
  prevInByte4 = inByte4;
  inByte4 = map(inByte4, 0, 1023, 0, height);
  stroke(255, 127, 34);
  line(xPos, (height-inByte4)-2, xPos, height - inByte4);//graph  




  txt.println(list[0]+ ", " + list[1]+ ", " + list[2]+ ", " + list[3]+ ", " + list[4]+ ", " + millis() + ", " + frameNum);

  stroke(255);  
  fill(255);
  for (int i = 1; i<5; i++) {
    line(0, height-i*oneV, width, height-i*oneV);
    text (5-i+"v", 5, i*oneV-3);
  }
  // at the edge of the screen, go back to the beginning:
  if (xPos >= width) {
    xPos = 0;
    saveFrame("/Users/troy/Google Drive/TUe/Insights into Expirimental Data/Challenge2-IIED/Challenge2-IIED/graph"+ year() + month() + day() + hour() + minute()+ frameNum +".png");
    frameNum++;
    background(0);
  } else {
    // increment the horizontal position:
    xPos++;
  }
   fill(255);
    text ("Subject #" + subject + " Slide " + frameNum, width-150, 15);
}

/*
void serialEvent (Serial myPort) {
  // get the ASCII string:
  inString = myPort.readStringUntil('\n');

  if (inString != null) {
    // trim off any whitespace:
    inString = trim(inString);
  }
}
*/
void keyPressed() {
  if (key == 's')  txt.println("Start key pressed at " + millis() + ", " + frameNum);
  if (key == '1') {
    fill(255);
    stroke(127, 34, 255);   
    line(xPos, 0, xPos, height);
    text ("1", xPos+3, 10);
  }
  if (key == '2') {
    fill(255);
    stroke(34, 127, 255);   
    line(xPos, 0, xPos, height);
    text ("2", xPos+3, 10);
  }
  if (key == '3') {
    fill(255);
    stroke(127, 255, 34);   
    line(xPos, 0, xPos, height);
    text ("3", xPos+3, 10);
  }
  if (key == '4') {
    fill(255);
    stroke(255, 127, 34);   
    line(xPos, 0, xPos, height);
    text ("4", xPos+3, 10);
  }  
}

