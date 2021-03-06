require 'sinatra'
require 'sinatra/reloader'

	@@rando = rand(100)

get '/' do
	message = check_guess(params['guess'].to_i) if params['guess']
	cheat   = params['cheat']

	
	erb :index, :locals => {:cheat => cheat, :answer => @answer, :rando => @@rando}

	# throw params.inspect
end

def check_guess(guess)
	case guess
	when @@rando       then @answer = "you got it! it was #{@@rando}"
	when (@@rando - 5)..@@rando then @answer = "just a bit too small"
	when @@rando..(@@rando + 5) then @answer = "just a bit too big"
	when 0...@@rando   then @answer = "way too small"
	when @@rando..100  then @answer = "way too big"
	end
end

