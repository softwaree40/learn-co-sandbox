class ReviewsController < ApplicationController
      
  get '/games/:id/review/new' do 
      @game = Game.find(params[:id])
      erb :'reviews/new'
  end
  
   post '/games/:id/review' do 
     game = Game.find(params[:id])
     Review.create(game: game, comment: params[:comment], user: current_user )
     redirect "/games/#{game.id}"
   end
   
   
   
   patch "/games/:id" do 
      @game = Game.find(params[:id])
      redirect '/games'
   end
   
   
   
   
   
   
   
   helpers do 
    def current_user
       User.find_by(id: session[:user_id])
    end
  end
  
end