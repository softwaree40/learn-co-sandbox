class ReviewsController < ApplicationController
      
  get 'games/:id/review/new' do 
      @game = Game.find(params[:id])
      erb :'reviews/new'
  end
  
   post '/reviews' do 
     
   end
  
end