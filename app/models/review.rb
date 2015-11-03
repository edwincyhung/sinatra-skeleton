class Review < ActiveRecord::Base

  def initialize(rating, comment)
    @rating = rating
    @comment = comment
  end
end
