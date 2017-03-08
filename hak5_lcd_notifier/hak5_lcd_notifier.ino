#include <LiquidCrystal.h>
LiquidCrystal lcd (12, 11, 5, 4, 3, 2);
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  lcd.begin(16, 2);
}

void write_message(){
  lcd.clear();
  lcd.setCursor(1,0);
  lcd.write("Hak5 uploaded");
  lcd.setCursor(2,1);
  lcd.write("a new video!");
}

void write_sad_message(){
  lcd.clear();
  lcd.setCursor(1,0);
  lcd.write("No new videos");
  lcd.setCursor(7,1);
  lcd.write(":(");
}
void got_char(char x){
  if(x == 'b')
    write_message();
  else
    write_sad_message();
}

void loop() {
  // put your main code here, to run repeatedly:
  if(Serial.available() > 0) {
    byte byte_read = Serial.read();
    got_char((char)byte_read);
  }
}

