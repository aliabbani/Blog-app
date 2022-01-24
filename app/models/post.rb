class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :user

  def recent_comments
    comments.order('created_at Desc').limit(5)
  end

  after_save :update_posts_counter

  private
  def update_posts_counter
    user.increment!(:posts_counter)
  end
end
