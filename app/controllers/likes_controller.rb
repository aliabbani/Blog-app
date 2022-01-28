class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.new(author_id: current_user.id, post_id: @post.id)

    respond_to do |format|
      format.html do
        if @like.save!
          redirect_to user_post_path(@post.author.id, @post.id), notice: 'You have successfully liked this post!.'
        else
          redirect_to user_post_path(@post.author.id, @post.id), alert: "You're stuck here!"
        end
      end
    end
  end
end
