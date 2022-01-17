class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
end

# A method that updates the likes counter for a post.