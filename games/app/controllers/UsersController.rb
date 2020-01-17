class UsersController < ApplicationController
     
     # Shows Sign Up Page
     get '/signup' do
        erb :'users/signup' 
     end
     
     post '/signup' do 
       binding.pry
       redirect '/login'
     end
    
end