class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
end

# A method that updates the comments counter for a post.