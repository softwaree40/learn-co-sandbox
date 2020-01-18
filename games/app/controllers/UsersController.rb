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
          redirect '/login'
        end
          
     end
     # Login Form 
      get "/login" do
        
        erb :"/users/login" 
      end
      
      post "/login" do 
         #check if user is real user in your database and password passes
        users = User.find_by(username: params[:user][:username])
        if users.authenticate(params[:user][:password]) 
        # if user succefully logs in save user id to session
         session[:user_id] = users.id
         redirect '/profilepage'
       else
         redirect "/login"
       end
         
      end
      get "/profilepage" do 
          @users = current_user
          #binding.pry
        erb :"/users/profilepage"
      end
  get "/logout" do 
      session[:user_id].clear
          
    erb:"/login"
  end
  
  
  
  
  
  
  
  
  helpers do 
    def current_user
       User.find_by(id: session[:user_id])
    end
  end
    
  
end