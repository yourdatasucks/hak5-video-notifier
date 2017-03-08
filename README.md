## Hak5 Video Notifier

##### Fun little project I worked on for learning how to program a small lcd screen with an arduino

### Requirements
* ##### Hardware
  1. Some type of arduino board (I used an Uno that I had lying around)
  2. An lcd display (I used a 16x2 display)
  3. 10k potentiometer (Control backlight of lcd) 
  4. Computer to program and connect arduino to

* ##### Software
  1. Arduino IDE
  2. ruby
    * ruby requirements: gmail gem, serialport gem
  3. gmail account
  
  
### Warning: I used a mac (OSX 10.11.6) and an older version of the arduino ide (1.6.11) to complete this project. I started on windows with a newer version of the arduino ide and did not know how to get the info I needed for one specific variable; could have been an OS difference or it could have been a version difference between the ides
### That specific variable is in
# main.rb
### and the variable name is
# port_file

###### I didn't bother figuring out the windows side because there were deeper issues with ruby I had, and I had a mac/linux box with everything all set up, so fuck windows. If I had to guess the port_file variable that I needed to figure out would have been "COM3" (for me, this will probably change on your machine), but I don't know for sure.

## Setup
Firstly, in gmail a label needs to be created to keep all of the hak5 videos in one place and basically give us something to query. Also, a filter needs to be created to automatically label incoming videos. I found from:youtube subject:(Hak5 just uploaded a video) to easily get all of the videos labeled. Lastly, make sure the gmail account has less secure apps enabled.
  * I forgot to mention, the notifications need to be set from youtube to be sent to the gmail account (Account Settings > Notifications > Channel Subscriptions > Subscriptions: Notifiy me via )

Next setup the arduino board and lcd screen. The arduino website has a wiring diagram to guide you: https://www.arduino.cc/en/Tutorial/LiquidCrystalSetCursor

Now that everything is set up go to the main.rb file; there are a couple of lines to change here or to set up. There are reminders in the script but I will outline them briefly here.
  * port_file needs to be changed; on my ide and mac the input can be found in the lower right hand corner of the arduino ide
  * I used environment variables so I didn't upload my credentials on github. You can either hard code in a username and password or set up environment variables. Your choice.
  * It is advisable to change the wait_time variable. It is set to 4 seconds for testing, but it isn't necessary to check labels that frequently for notifications that are being sent two to three days a week.

Now all that is left is uploading the arduino code, and then run the main.rb file and watch your notifications come in on the lcd.

Once it is set up and running correctly, look into the reference material for LiquidCrystal; this is a simple example of the lcd. It can be set to scroll, blink, and more. Just play around.