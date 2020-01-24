class ReviewsController < ApplicationController
      
  get '/games/:id/review/new' do 
      @game = Game.find_by(id: params[:id])
      erb :'reviews/new'
  end
  
   post '/games/:id/review' do 
     game = Game.find_by(id: params[:id])
     if params[:comment].blank?
       redirect "/games/#{game.id}/review/new"
      else
        Review.create(game: game, comment: params[:comment], user: current_user )
        redirect "/games/#{game.id}"
      end
    end
     

    get "/games/:id/review/edit" do 
       @review = find_users_review
      redirect "/games/#{params[:id]}" if @review.nil?
      
      erb :"/reviews/edit"
   end
   
   patch "/games/:id/review" do
      review = find_users_review
      review.update(comment: params[:comment])
      redirect "/games/#{review.game.id}"
   end
   
    delete '/games/:id/review/delete' do
      find_users_review.destroy 
      redirect "/games/#{params[:id]}"
    end
    
    get "/games/:id/edit" do 
      @game = Game.find(params[:id])
      erb :'/games/edit'
    end
   
   
   patch "/games/:id" do
      game = Game.find(params[:id])
      redirect '/games'
   end
   
   
   
   
   
   
   
   helpers do 
      def current_user
         User.find_by(id: session[:user_id])
      end
      
      def find_users_review
        game = Game.find(params[:id])
        Review.find_by(game: game, user: current_user)
      end
    end
  
end