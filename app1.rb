require'sinatra'
require'sinatra/reloader'

get'/' do
erb :index
end

get'/visit' do
	erb :visit
end

post'/visit' do
	@username = params[:username]
	@phone = params[:phone]
	@date_time = params[:date_time]
	@master = params[:master]
	@message =" Dear #{@username} ,Phone #{@phone}, we signed up #{@date_time} to the master: #{@master}" 
	
	
	f = File.open"./public/users.txt","a"
	f.write"User: #{@username} Phone: #{@phone} Date and Time: #{@date_time} to the master: #{@master}\n"
	f.close
	erb :message	
	end
	


get'/contact' do
	erb :contact
end

post'/contact' do
	@email = params[:email]
	@sms = params[:sms]
	@message = "Dear: #{@email} you left: #{@sms} "
m = File.open"./public/contacts.txt","a"
m.write"Email: #{@email} left: #{@sms}\n "
m.close
erb :message
	end

get'/about' do
	erb :about
end