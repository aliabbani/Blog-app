class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
end

# A method that updates the likes counter for a post.
def update_likes_counter
  Post.select.update(:likes_counter).count
end

# if we add or delete a like from a post
# the likes_counter will be updated in the post table