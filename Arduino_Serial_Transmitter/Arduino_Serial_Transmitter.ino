void setup() {
  // initialize the serial communication:
  Serial.begin(115200);
  delay(20);//wait for things to stablize
  Serial.println("0");
}

void loop() {
  // send the value of a
  Serial.print(millis());
  Serial.print (",");
  Serial.print(analogRead(A3));
  Serial.print (",");
  delay(1);
  Serial.print(analogRead(A1));
  Serial.print (",");
  delay(1);
  Serial.print(analogRead(A0));
  Serial.print (",");
  delay(1);
  Serial.println(analogRead(A2));
  delay(1);
}


