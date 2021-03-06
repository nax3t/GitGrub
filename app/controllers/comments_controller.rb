class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to posts_path
    else
      redirect_to posts_path, :alert => "Comment must contain a message!"
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end

