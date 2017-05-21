class Post < ApplicationRecord
  has_many :comments

  validates :title, length: { minimum: 3 }
  validates :author, length: { minimum: 3 }
  validates :description, length: { minimum: 5 }

  before_validation :set_image

  mount_uploaders :files, FileUploader

  def like
    increment!(:likes)
  end

  def unlike
    decrement!(:likes)
  end

  private

  def set_image
    self.image = "flower#{rand(1...10)}.jpg"
  end

end
