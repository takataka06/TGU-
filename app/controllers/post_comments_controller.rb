class PostCommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.post_comments.new(post_comment_params) # user_id is set automatically by current_user
    @comment.post_id = @post.id
    if @comment.save
      flash[:notice] = "コメントが投稿されました!"
      redirect_to post_path(@post)
    else
      @comments = @post.post_comments
      flash[:alert] = "コメントの投稿に失敗しました。内容を確認してください。"
      render "posts/show"
    end

  end
  def destroy
    comment = PostComment.find(params[:id])
    if comment.destroy
      flash[:notice] = "コメントを削除しました"
      redirect_to post_path(params[:post_id])
    else
      flash[:alert] = "コメントの削除に失敗しました"
      redirect_to post_path(params[:post_id])
    end
  end

  private
  #strong parameters for post comments
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
