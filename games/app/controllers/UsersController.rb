class UsersController < ApplicationController
     
     # Shows Sign Up Page
     get '/signup' do
        erb :'users/signup' 
     end
     
     post '/signup' do
       #if user enter blank information check
       if params[:user].values.any?{|value| value.blank?}
          redirect '/signup'
          #if username already exist in database
        elsif User.find_by(username: params[:user][:username])
             redirect "/signup"
        else
          #if test pass create instance 
          users = User.create(params[:user])
          #Need to log them in
          
      
          redirect '/login'
        end
          
     end
     
     
     # Login Form 
      get "/login" do
        binding.pry
         
      end
      
      post "/login" do 
        # check form validation 
        
        #check if user is real user in your database and password passes 
        
         # if user succefully logs in save user id to session
         session[:user_id] = users.id
      end
end