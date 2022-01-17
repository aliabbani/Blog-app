class User < ApplicationRecord
end
# A method that returns the 3 most recent posts for a given user.
def recent_3_posts
    post.last(3)
end



# "Ali Abbani" post1
# "Ali Abbani" post 2
# "Ali Abbani" post 3

# id = 1 post1
# id = 1 post2
# id = 1 post3