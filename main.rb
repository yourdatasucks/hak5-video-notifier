require 'gmail'
require 'serialport'
  ##############################################################
  # Set UNAME and PW as environment variables in your system   #
  # OR you hardcode them into the connect method               #
  # UNAME is the gmail account, ie. example@gmail.com          #
  # PW is the password for that gmail account                  #
  # Don't forget to enable access for less secure apps         #
  #   on your gmail account                                    #
  ##############################################################

	gmail = Gmail.connect!(ENV['UNAME'], ENV['PW'])

  prev_unread = 0

  #############################################################
  # This port_file variable will most likely change for you   #
  # Look in the bottom right hand corner of the arduino ide   #
  # to see what you need to put in for the serial port        #
  #############################################################

  port_file = '/dev/cu.usbmodem621'

  baud_rate = 9600

  data_bits = 8
  stop_bits = 1
  parity = SerialPort::NONE

  port = SerialPort.new(port_file, baud_rate, data_bits, stop_bits, parity)

  # you may want to change this wait_time variable; it is in seconds
  # update: change the wait_time variable in the else statement
  #   of the loop; this way when no new notifications are available
  #   the count of messages has more delay; if we have unread 
  #   messages we wait for 10 seconds to see if we have looked at 
  #   the new message; not perfect, but better than original
  wait_time = 10

  loop do

    unread = gmail.mailbox('Hak5 Videos').count(:unread)
    puts "prev_unread: #{prev_unread}"
    puts "Unread: #{unread}"
    puts "Checked unread."

    if unread > prev_unread
      #puts "should be writing new vid"
      wait_time = 10
      port.write "b"
    else
      #puts "should be writing no new vids"
      wait_time = 3600
      prev_unread = unread
      port.write "c"
    end

    sleep wait_time
  	
end