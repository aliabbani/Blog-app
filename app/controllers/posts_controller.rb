class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id 
    # 1 = 1
    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = "Question saved successfully"
          redirect_to user_posts_url
        else
          flash.now[:error] = "Error: Question could not be saved"
          render :new 
        end
      end
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :text)
  end

end
