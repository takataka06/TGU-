class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: @post.id)
    if favorite.save
      flash[:notice] = "投稿にいいね！しました"
      redirect_to post_path(@post)
    else
      flash[:alert] = "投稿にいいね！できませんでした"
      redirect_to post_path(@post)
    end
  end
  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: @post.id)
    if favorite&.destroy
      flash[:notice] = "投稿のいいね！を解除しました"
      redirect_to post_path(@post)
    else
      flash[:alert] = "投稿のいいね！解除に失敗しました"
      redirect_to post_path(@post)
    end
  end
end
