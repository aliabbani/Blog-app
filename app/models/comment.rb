class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
end

# A method that updates the comments counter for a post.
def update_comments_counter
  Post.select.update(:comments_counter).count
end

# if we add or delete a comment from a post
# the comments_counter will be updated in the post table
