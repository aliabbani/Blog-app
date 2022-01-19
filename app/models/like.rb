class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  private

  def update_likes_counter
    self.update_counter_likes = Post.select.update(:likes_counter)
    save
  end
end
