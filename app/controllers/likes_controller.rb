class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.create!(author_id: current_user.id, post_id: @post.id)

    respond_to do |format|
      format.html do
        redirect_to user_post_path(@post.author.id, @post.id) if @like.save!
      end
    end
  end
end
