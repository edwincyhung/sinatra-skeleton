class User < ActiveRecord::Base

  def initialize(name, email, password)
    @name = name
    @email = email
    @password = password
  end
  
end