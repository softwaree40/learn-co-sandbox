class ReviewsController < ApplicationController
      
  get '/games/:id/review/new' do 
      @game = Game.find(params[:id])
      erb :'reviews/new'
  end
  
   post '/games/:id/review' do 
     game = Game.find(params[:id])
     Review.create(game: game, comment: params[:comment])
     redirect "/games/#{game.id}"
   end
  
end