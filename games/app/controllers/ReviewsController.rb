class ReviewsController < ApplicationController
      
  get '/games/:id/review/new' do 
      @game = Game.find_by(id: params[:id])
      erb :'reviews/new'
  end
  
   post '/games/:id/review' do 
     game = Game.find_by(id: params[:id])
     Review.create(game: game, comment: params[:comment], user: current_user )
     redirect "/games/#{game.id}"
   end
     
    get "/games/:id/review/edit" do 
      @review = find_users_review(params[:id])
      erb :"games/edit"
   end
   
   patch "/games/:id/review" do
      review = find_users_review(params[:id])
      review.update(comment: params[:comment])
      redirect "/games/#{review.game.id}"
   end
   
   delete '/games/:id/review/delete' do
      find_users_review(params[:id]).destroy 
      redirect "/games/#{params[:id]}"
   end
   
   
   
   
   
   
   
   helpers do 
    def current_user
       User.find_by(id: session[:user_id])
    end
    
    def find_users_review(game_id)
      game = Game.find(game_id)
      Review.find_by(game: game, user: current_user)
    end
  end
  
end