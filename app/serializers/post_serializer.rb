class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :meta, :image, :comments, :files

  def meta
    {
      likes: object.likes,
      author: object.author,
      createdAt: object.created_at
    }
  end

  def image
    {
      src: full_path(object.image)
    }
  end

  def comments
    object.comments.map do |c|
      c.user_avatar = full_path(c.user_avatar)
    end
    object.comments
  end

  def files
    object.files.map do |file|
      {
        url: full_path(file.url),
        name: File.basename(file.url)
      }
    end
  end

  private

  def full_path(url)
    "#{@instance_options[:url]}/#{url}"
  end

end
