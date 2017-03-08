require 'gmail'
require 'serialport'


	gmail = Gmail.connect!(ENV['UNAME'], ENV['PW'])

	#count the number of unread messages
prev_unread = 0


port_file = '/dev/cu.usbmodem621'


baud_rate = 9600

data_bits = 8
stop_bits = 1
parity = SerialPort::NONE

port = SerialPort.new(port_file, baud_rate, data_bits, stop_bits, parity)

wait_time = 4

loop do
  unread = gmail.mailbox('Hak5 Videos').count(:unread)
  puts "prev_unread: #{prev_unread}"
  puts "Unread: #{unread}"
  puts "Checked unread."

  if unread > prev_unread
    #puts "should be writing new vid"
    port.write "b"
  else
    #puts "should be writing no new vids"
    prev_unread = unread
    port.write "c"
  end
  	

  

  sleep wait_time
end