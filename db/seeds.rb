keywords = %w(rose lily begonia sunflower violets)
(1..10).each do |i|
  Post.new(
    title: "Post #{keywords.sample}",
    description: "Post #{keywords.sample} description",
    author: "user_#{i}",
    likes: rand(1...10),
    image: "flower#{i}.jpg"
  ).save(validate: false)
end
