class CommentsController < ApplicationController
  # def new
  #   @comment = Comment.new
  # end

  def create
    @post = Post.find(params[:post_id]) 
    @comment = Comment.create(params.require(:comment).permit(:text))
    @comment.post_id = @post.id 
    @comment.user_id = current_user.id
    
    # @post = Post.find(params[:id]) 
    # @comment = @post.comments.create(:text, user_id: current_user.id, post_id: @post.id)
    respond_to do |format|
      format.html do
        if @comment.save
          redirect_to user_post_path(current_user.id, @post.id)
        else
          redirect_to user_post_path(current_user.id, @post.id)
        end
      end
    end
  end

  private

  def comment_parameters
    params.require(:comment).permit(:text)
  end
end