void setup() {
  // initialize the serial communication:
  Serial.begin(250000);
  delay(20);//wait for things to stablize
  Serial.println("0")
}

void loop() {
  // send the value of a
  Serial.print(millis());
  Serial.print (",");
  Serial.print(analogRead(A0));
  delay(1);
  Serial.println(analogRead(A1));
  delay(1);
  Serial.println(analogRead(A1));
  delay(1);
  Serial.println(analogRead(A2));
  delay(1);
  Serial.println(analogRead(A3));
  delay(1);
}


