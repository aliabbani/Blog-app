# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)..

amine = User.create!(name: 'Amine', photo: 'image1' , bio: 'lorem40', posts_counter: 0)
ali = User.create!(name: 'Ali', photo: 'image2', bio: 'lorem40', posts_counter: 0)
henry = User.create!(name: 'Henry', photo: 'image3' , bio: 'lorem40', posts_counter: 0)
lara = User.create!(name: 'Lara', photo: 'image4', bio: 'lorem40', posts_counter: 0)


post1 = amine.posts.create!(author_id: 1, title: 'Cats and Dogs', text: 'this is first post about cats and dogs!', comments_counter: 0, likes_counter: 0)
post2 = ali.posts.create!(author_id: 2, title: 'Never ending fun', text: 'this is second post but I don\'t think I should create another post again', comments_counter: 0, likes_counter: 0)
post3 = henry.posts.create!(author_id: 3, title: 'Cold and Snow', text: 'this is the best weather I can ever have', comments_counter: 0, likes_counter: 0)
post4 = lara.posts.create!(author_id: 4, title: 'Clothes make you confident', text: 'this Armani jeans is so comfortable in the body', comments_counter: 0, likes_counter: 0)

amine.comments.create!(text: 'really nice post Michael', post: post1)
ali.comments.create!(text: 'Well Done 👏👏👏', post: post1)
ali.comments.create!(text: 'Love 💓 it!!!', post: post1)