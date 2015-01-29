class CommentsController < ApplicationController
  # def create
  #   @post = Post.find(params[:post_id])
  #   @comment = @post.comments.new(comment_params) # strong parameters
  #   @comment.user = current_user
  #   if @comment.save
  #     respond_to do |format|
  #       format.html do
  #         flash[:success] = 'Comment posted.'
  #         redirect_to @post
  #       end
  #       format.js # JavaScript response
  #     end
  #   end
  # end
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to posts_path
    else
      render :comment
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end

