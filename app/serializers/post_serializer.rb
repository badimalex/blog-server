class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :meta, :image, :comments

  def meta
    {
      likes: object.likes,
      author: object.author,
      createdAt: object.created_at
    }
  end

  def image
    {
      src: "#{@instance_options[:url]}/#{object.image}"
    }
  end

  def comments
    object.comments.map do |c|
      c.user_avatar = "#{@instance_options[:url]}/#{c.user_avatar}"
    end
    object.comments
  end

end
