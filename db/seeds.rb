# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

wendy = User.create!(name: 'Wendy', photo: image2 , bio: lorem40, posts_counter: 0)
john = User.create!(name: 'John', photo: image3, bio: lorem40, posts_counter: 0)

post1 = michael.posts.create!(title: 'Cats and Dogs', text: 'this is first post about cats and dogs!', comments_counter: 0, likes_counter: 0)
post2 = john.posts.create!(title: 'Never ending fun', text: 'this is second post but I don\'t think I should create another post again', comments_counter: 0, likes_counter: 0)

wendy.comments.create!(text: 'really nice post Michael', post: post1)
john.comments.create!(text: 'Well Done 👏👏👏', post: post1)
john.comments.create!(text: 'Love 💓 it!!!', post: post1)