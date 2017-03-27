20.times do
  post = Post.create!( title: Faker::Company.catch_phrase,
                       username: Faker::Internet.user_name,
                       comment_count: rand(1000),
                       content: Faker::ChuckNorris.fact
  )
  
  vote_count = rand(100)
  vote_count.times do
    post.votes.create!(value: 1)
  end
end
