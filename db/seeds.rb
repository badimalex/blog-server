keywords = %w(rose lily begonia sunflower violets)
(1..10).each do |i|
  Post.create(
    title: "Post #{keywords.sample}",
    description: "Post #{keywords.sample} description",
    author: "user_#{i}",
    likes: rand(1...10),
    image: "flower#{i}.jpg"
  )
end
