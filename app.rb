require 'sinatra/base'
require './lib/player'

class RockPaperScissors < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/name' do
    $player = Player.new(params[:name])
    redirect '/play'
  end

  get '/play' do
    @player = $player
    erb :play
  end

  post '/move' do
    $move = params[:move]
    redirect '/result'
  end

  get '/result' do
    @player = $player
    erb :result
  end

  run! if app_file == $0

end