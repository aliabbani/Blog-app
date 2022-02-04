class CommentsController < ApplicationController
  load_and_authorize_resource

  def index
    @comments = Post.find(params[:post_id]).comments
    render json: @comments, status: :ok
  end

  def show
    @comment = Comment.find(params[:id])
    render json: @comment
  end

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(text: comment_params[:text], author_id: current_user.id, post_id: @post.id)
    if @comment.save!
      render json: { 'success' => 'You have successfully created a comment'}, status: :created
    else
      render json: { 'error' => 'Error :Comment could not be saved' }, status: 'Bad'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @comment.destroy!
    head :no_content
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
# redirect_to user_post_path(@post.author.id, @post.id)
