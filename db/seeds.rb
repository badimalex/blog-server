keywords = ["flower", "banana", "kiwi"]
(1..10).each do |i|
  Post.create(
    title: "Post #{keywords.sample}",
    description: "Post #{keywords.sample} description",
    author: "user_#{i}",
    likes: rand(1...5),
    image: "flower#{rand(1...5)}.jpg"
  )
end
