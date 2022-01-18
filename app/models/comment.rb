class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  private

  def update_comments_counter
    self.update_comments_couner = Post.select.update(:comments_counter).count
    save
  end
end

# A method that updates the comments counter for a post.
