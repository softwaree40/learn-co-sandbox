require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "Hack_me_if_you_can"
  end

  get "/" do
    erb :welcome
  end
    helpers do 
    def current_user
       User.find_by(id: session[:user_id])
    end
     def find_users_review
        game = Game.find(params[:id])
        Review.find_by(game: game, user: current_user)
      end
       def log_in?
          !!session[:user_id]
       end
       def redirect_if_not_login
          if !log_in?
          redirect "/login"
          end
       end
  end
    
   
end
