class GamesController < ApplicationController
      
    get '/games' do
      @games = Game.all
      erb :'games/index'
    end
    
    get '/games/:id' do
      @game = Game.find(params[:id])
      user = current_user
      @user_review_ids = user.reviews.map{|review| review.id}
      erb :'games/show'
    end
    
    get '/my-games' do 
      @user = current_user
      erb :'games/user_games_index'
    end
  
  
  
  
  helpers do 
    def current_user
       User.find_by(id: session[:user_id])
    end
  end
end