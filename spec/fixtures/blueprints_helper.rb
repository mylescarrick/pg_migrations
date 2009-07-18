def create_post_and_comments
  post = Post.make
  5.times do
    Comment.make(:post => post)
  end
  post
end