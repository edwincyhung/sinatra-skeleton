class Restaurant < ActiveRecord::Base

  has_many :items

  def initialize (name, street, city)
    @name = name
    @street = street
    @city = city
  end
end