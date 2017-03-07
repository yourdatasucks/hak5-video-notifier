require 'gmail'
require 'serialport'


	gmail = Gmail.connect!(ENV['UNAME'], ENV['PW'])

	#count the number of unread messages
prev_unread = gmail.mailbox('Hak5 Videos').count(:unread)


port_file = '/dev/cu.uart'


baud_rate = 9600

data_bits = 8
stop_bits = 1
parity = SerialPort::NONE

port = SerialPort.new(port_file, baud_rate, data_bits, stop_bits, parity)

wait_time = 4

loop do
  unread = gmail.mailbox('Hak5 Videos').count(:unread)

  puts "Checked unread."

  if unread > prev_unread
    port.write "b"
  else
  	port.write "c"
  end
  	

  prev_unread = unread

  sleep wait_time
end