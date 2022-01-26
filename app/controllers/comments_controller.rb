class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(text: comment_params[:text], author_id: current_user.id, post_id: @post.id)

    respond_to do |format|
      format.html do
        redirect_to user_post_path(@post.author.id, @post.id) if @comment.save
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
