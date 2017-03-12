class Post < ApplicationRecord

  def like
    increment!(:likes)
  end

  def unlike
    decrement!(:likes)
  end

end
