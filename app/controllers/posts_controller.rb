class PostsController < ApplicationController
  def index
    @posts =Post.all
    @post = Post.new
  end

  def new
    @post =Post.new
  end

  def show
  end

  def edit
    @post =Post.find(params[:id])
  end
  def create
    @post =Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] ="投稿が完了しました!"
      redirect_to posts_path
    else
      @posts = Post.all
      flash.now[:notice] ="投稿に失敗しました!"
      render :index
    end
  end
  def destroy
  end
  def update
  end
  private

  def post_params
    params.require(:post).permit(:title, :body)
  end  
end
