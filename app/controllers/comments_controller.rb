class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:id]) posts/id
    @comment = Comment.new(params.require(:comment).permit(:text))
    @comment.user_id = current_user.id
    @comment.post_id = @post.id
    
    respond_to do |format|
      format.html do
        if @comment.save
          flash[:success] = "Question saved successfully"
          redirect_to user_post_path
        else
          flash.now[:error] = "Error: Question could not be saved"
          render :new 
        end
      end
    end
  end
end