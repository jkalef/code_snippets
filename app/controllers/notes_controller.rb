class NotesController < ApplicationController

	#must sign in before using this application
  	before_action :authenticate_user!, except: [:index, :show]

	#--ACTIONS---------------------------------------------

	def index
		if params[:search_term]
			#view all notes with the search_term
			@notes = Note.find_notes(params[:search_term])
		else
			#view all the notes not relating to search term
			@notes = Note.all.order("topic DESC")
		end

		#--use this to display the total number of notes per topic
		@rails_total = Note.rails_total
		@ruby_total = Note.ruby_total
		@js_total = Note.js_total
		@jQuery_total = Note.jQuery_total
		@html_css_total = Note.html_css_total
	end


	def show	
		#display the specific note for now
		@note = Note.find(params[:id])
		#@note = current_user.notes.find(params[:id])
	
		#empty comment to create a new one
		@comment = Comment.new

		#display the comments associated with this note
		@comments = @note.comments.most_recent_comments
	end


	def create
		#create a new note with note_params
		#@note = Note.new(note_params)

		#current_user will create this note
		@note = current_user.notes.new(note_params)
		if @note.save
			redirect_to root_path, notice: "Note Successfully Created"
		else
			render :new
		end
	end


	def new
		#create a new note
		@note = Note.new
	end


	def update
		@note = Note.find(params[:id])
		if @note.update(note_params)
			redirect_to root_path, notice: "Note Successfully Updated"
		else
			render :edit
		end
	end


	def edit
		@note = Note.find(params[:id])
	end


	def destroy
		@note = Note.find(params[:id])
		@note.destroy
		redirect_to root_path, notice: "Note Successfully Deleted"
	end


	#----list view for notes within a specific category---------
	def list
		@notes = Note.where(topic: params[:topic])
	end



	#--CLASS METHODS------------------------------------------

	private

	def note_params
		params.require(:note).permit(:title, :topic, :category, :snippet, :snippet_note)		
	end



end
