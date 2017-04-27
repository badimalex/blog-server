class Comment < ApplicationRecord
  AVATARS = %w(eliot.jpg jenny.jpg joe.jpg matt.jpg)

  belongs_to :post

  validates :user_name, length: { minimum: 3 }
  validates :text, length: { minimum: 5 }

  before_save :set_avatar

  private

  def set_avatar
    self.user_avatar = AVATARS.sample
  end

end
