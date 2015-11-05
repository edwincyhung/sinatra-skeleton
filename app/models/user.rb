class User < ActiveRecord::Base

  has_many :reviews

  def initialize(name, email, password)
    @name = name
    @email = email
    @password = password

  end
  
end