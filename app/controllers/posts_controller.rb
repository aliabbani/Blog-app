class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.all
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def new
    post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: post } }
    end
  end

  def create
    # new object from params
    post = Post.new(params.require(:post).permit(:question, :answer, :distractor_1, :distractor_2))
    # respond_to block
    respond_to do |format|
        format.html do
            if post.save
                # success message
                flash[:success] = "Question saved successfully"
                # redirect to index
                redirect_to user_posts_url
            else
                # error message
                flash.now[:error] = "Error: Question could not be saved"
                # render new
                render :new, locals: { post: post }
            end
        end
    end
  end
end
