class Item < ActiveRecord::Base

  def initialize (name, price)
    @name = name
    @price = price
  end
end
