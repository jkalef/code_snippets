class Comment < ActiveRecord::Base

	#--ASSOCIATIONS-----------------------------
	belongs_to :note
	belongs_to :user


	#--VALIDATIONS------------------------------
	validates :body, presence: true


	#--CLASS METHODS----------------------------
	#view the most recent comments 
	def self.most_recent_comments
		Comment.order("created_at DESC")
	end

end
