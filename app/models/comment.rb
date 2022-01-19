class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  private

  def update_comments_counter
    self.update_counter_comments = Post.select.update(:comments_counter)
    save
  end
end
