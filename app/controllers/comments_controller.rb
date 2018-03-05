class CommentsController < ApplicationController

	def new
    	@comment = current_user.comments.build
  	end

	def create
		@comment = current_user.comments.build(comment_params)
		@post = Post.find(params[:post_id])	
		@comment.post_id = @post.id
		@comment.save
		redirect_to post_path(@post)
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end


	private
	def comment_params
      params.require(:comment).permit(:body, :user_id, :post_id)
    end

end
