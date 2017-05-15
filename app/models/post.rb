class Post < ApplicationRecord
  has_many :comments

  validates :title, length: { minimum: 3 }
  validates :author, length: { minimum: 3 }
  validates :description, length: { minimum: 5 }

  def like
    increment!(:likes)
  end

  def unlike
    decrement!(:likes)
  end

end
