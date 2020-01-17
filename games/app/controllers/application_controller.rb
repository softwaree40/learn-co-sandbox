require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable
  end

  get "/" do
    erb :welcome
  end
   
end
