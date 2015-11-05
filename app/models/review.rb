class Review < ActiveRecord::Base

  belongs_to :item
  belongs_to :user

  def initialize(rating, comment)
    @rating = rating
    @comment = comment
  end
end
