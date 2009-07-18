Sham.title { Faker::Lorem.sentence }
Sham.body { Faker::Lorem.paragraph }

Post.blueprint do
end

Comment.blueprint do
  post { Post.make }
end