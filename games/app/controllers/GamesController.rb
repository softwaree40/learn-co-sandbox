class GamesController < ApplicationController
      
    get '/games' do
      @games = Game.all
      erb :'games/index'
    end
    
    get '/games/:id' do
      @game = Game.find_by(id: params[:id])
      erb :'games/show'
    end
  
  
end