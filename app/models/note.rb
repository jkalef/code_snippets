class Note < ActiveRecord::Base

	#--ASSOCATIONS---------------------------
	has_many :comments, dependent: :destroy
	belongs_to :user


	#--VALIDATIONS----------------------------
	validates :title, presence: true
	validates :snippet, presence: true


	#--SCOPES---------------------------------

	scope :rails_total, lambda { where(topic: "Rails").count }
	scope :ruby_total, lambda { where(topic: "Ruby").count }
	scope :js_total, lambda { where(topic: "Javascript").count }
	scope :jQuery_total, lambda { where(topic: "jQuery").count}
	scope :html_css_total, lambda { where(topic: "HTML/CSS").count }



	#--CLASS METHODS--------------------------
	#method for searching notes for a specific item
	def self.find_notes(search_term)
		Note.where("title ILIKE ? OR snippet_note ILIKE ?", "%#{search_term}%", 
																"%#{search_term}%")
	end

end
