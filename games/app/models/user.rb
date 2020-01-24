class User < ActiveRecord::Base
     has_secure_password
     #a macro. macros write methods for us. 
     #which methods does has_secure_password write 
     has_many :reviews
     has_many :games, through: :reviews
end
