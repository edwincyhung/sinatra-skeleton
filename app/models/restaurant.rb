class Restaurant < ActiveRecord::Base

  def initialize (name, street, city)
    @name = name
    @street = street
    @city = city
  end
end