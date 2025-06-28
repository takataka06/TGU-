class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]



  def index
    @posts =Post.order(created_at: :desc)
    @post = Post.new
  end

  def new
    @post =Post.new
  end

  def show
    @post =Post.find(params[:id])
  
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
    post =Post.find(params[:id])
    post.destroy
    redirect_to posts_path,notice: "投稿を削除しました"
  end
  def update
    @post =Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path,notice: "投稿を更新しました"
    else
      @posts =Post.all
      render :index
    end
  end
  private

  def post_params
    params.require(:post).permit(:title, :body)
  end  
end
