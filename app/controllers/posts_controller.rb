class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
    render json: @post
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    render json: @post
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.comments_counter = 0
    @post.likes_counter = 0
    if @post.save
      render json: { 'success' => 'You have successfully created a post'}, status: :created
    else
      render json: { 'error' => 'Error :Post could not be saved' }, status: 'Bad'
    end
  end

  def destroy
    @user = current_user
    @post = @user.posts.find(params[:id])
    @post.comments.destroy_all
    @post.likes.destroy_all
    @post.destroy
    head :no_content
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
