class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    # respond_to do |format|
      if @comment.save
      	render json:@comment
        # format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        # format.js   {}
        # format.json { render json: @comment, status: :created, location: @comment }
        # binding.pry
      else
        #format.html { render action: "new" }
        render json: @comment.errors
        #format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
  end


  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
