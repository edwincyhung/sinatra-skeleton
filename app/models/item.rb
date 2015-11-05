class Item < ActiveRecord::Base

  has_many :reviews
  belongs_to :restaurant

  def initialize (name, price)
    @name = name
    @price = price
  end
end
