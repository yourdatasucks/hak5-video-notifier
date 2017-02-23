require 'sinatra'
require 'gmail'
class Hak5Notifier < Sinatra::Base

	set :uname, ENV['USERNAME']
	set :pw, ENV['PASSWORD']
	gmail = Gmail.connect(settings.uname, settings.pw)

	get '/' do 
		@prev_unread = 0
		while @prev_unread == 0 do
			#get the number of unread messages in the inbox
			unread = gmail.mailbox('Hak5 Videos').count(:unread)

			if unread > @prev_unread
			    @newHak5Videos = unread
			end

			  #reset the number of unread emails
			  @prev_unread = unread


		end
		erb :'unread'
	end



end