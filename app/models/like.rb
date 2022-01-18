class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  private

  def update_likes_counter
    self.update_likes_couner = Post.select.update(:likes_counter).count
    save
  end
end

# A method that updates the likes counter for a post.
