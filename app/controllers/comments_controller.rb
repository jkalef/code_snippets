class CommentsController < ApplicationController

	#must sign in before using this feature
  	before_action :authenticate_user!

	#make a new comment
	def create
		#this will create the new comment with strong params
		#@comment = Comment.new(comment_params)

		#create a new comment from the current user who's signed in
		@comment = current_user.comments.new(comment_params)
		@note = Note.find(params[:note_id])
		@comment.note = @note

		if @comment.save
			redirect_to note_path(@note), notice: "Comment Successfully Created."
		else
			render text: params
		end
	end


	#delete a comment
	def destroy
		@comment = Comment.find(params[:id])
		@note = Note.find(params[:note_id])
		@comment.destroy

		redirect_to note_path(@note), notice: "Comment Deleted"
	end



	#--CLASS METHODS-------------------------------------

	private

	#strong params
	def comment_params
		params.require(:comment).permit(:body)
	end

end
