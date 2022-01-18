class Post < ApplicationRecord
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'
  belongs_to :user

  def recent_5_comments
    Comments.select('text').joins(:posts).last(5)
  end

  private

  def update_post_counter
    self.update_post_couner = User.select.update(:posts_counter).count
    save
  end
end
