class CommentsController < ApplicationController

	def create
		@comment = current_user.comments.create(comment_params)
		render json: @comment , status: :created
	end

  # def update
  # end

  # def destroy
  # end
end


private

def comment_params
	params.require(:comment).permit(:comment_body, :post_id)
end