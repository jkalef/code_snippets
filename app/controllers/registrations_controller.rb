class RegistrationsController < Devise::RegistrationsController
	
	#--CLASS METHODS------------------------------------------
	#taken from DEVISE documentation on changing routes
	def after_sign_up_path_for(resource)
		new_note_path
	end

	def after_inactive_sign_up_path_for(resource)
		new_note_path
	end

end