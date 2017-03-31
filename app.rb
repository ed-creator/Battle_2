require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base

enable :sessions

  get '/' do
   erb :index
  end

  post '/player_names' do
    player_1 = Player.new(params[:player_1])
    player_2 = Player.new(params[:player_2])
    $game = Game.new(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb :play
  end

  get '/validate' do
    @game = $game
    @game.validate(@game.receiver)
    @game.switch_players
    redirect '/game_over' if @game.winner?
    erb :validate
  end
  run! if app_file == $0
  
  get '/game_over' do
    $game.game_over
  end
end
