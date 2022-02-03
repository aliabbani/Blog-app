class CommentsController < ApplicationController
  load_and_authorize_resource

  def index; end

  def show; end

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(text: comment_params[:text], author_id: current_user.id, post_id: @post.id)

    respond_to do |format|
      format.html do
        if @comment.save!
          redirect_to user_post_path(@post.author.id, @post.id), notice: 'You have successfully added a comment!.'
        else
          redirect_to user_post_path(@post.author.id, @post.id), alert: "You're stuck here!"
        end
      end
    end
  end

  # def destroy
  #   # @post = Post.find(params[:post_id])
  #   @comments = Comment.find(params[:comment_id])
  #   @posts = @comments.post
  #   @comments.destroy
  #   flash[:alert] = 'Deleted user\'s comment'
  #   redirect_back fallback_location: [post.user, post]
  # end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @comment.destroy!
    flash[:success] = 'Removed comment!'
    redirect_to user_post_path(@post.author.id, @post.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
# redirect_to user_post_path(@post.author.id, @post.id)
