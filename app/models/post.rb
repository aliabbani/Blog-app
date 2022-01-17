class Post < ApplicationRecord
end

# A method that updates the posts counter for a user.
def update_post_counter
    User.select.update(:posts_counter).count
end

# if we add or delete a post from a user 
# the posts_counter will be updated in the user table

# A method which returns the 5 most recent comments for a given post.
def recent_5_comments
    # Comments.last(5)
    Comments.select('text').joins(:posts).last(5)
end