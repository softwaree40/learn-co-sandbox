class GamesController < ApplicationController
      
    get '/games' do
      @games = Game.all
       redirect_if_not_login
      erb :'games/index'
      
    end
    
    get '/games/:id' do
       
      @game = Game.find_by(id: params[:id])
      @user_review_ids = current_user.reviews.map{|review| review.id}
    
      erb :'games/show'
    end
    
    get '/my-games' do 
      @user = current_user
      erb :'games/user_games_index'
    end
  
  
end