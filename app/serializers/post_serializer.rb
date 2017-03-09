class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :meta, :image

  def meta
    {
      likes: object.likes,
      author: object.author
    }
  end

  def image
    {
      src: "#{@instance_options[:url]}/#{object.image}"
    }
  end

end
