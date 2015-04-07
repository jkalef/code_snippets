module NotesHelper

	#--CUSTOM FORM HELPERS--------------------
	#this is for the topic_list on my drop-down
	def options_for_topic
		[
			["Rails", "Rails"],
			["Ruby", "Ruby"],
			["Javascript", "Javascript"],
			["jQuery", "jQuery"],
			["HTML/CSS", "HTML/CSS"]
		]
	end

	#this is for the category_list on my drop-down
	def options_for_category
		[
			["Back End", "Back End"],
			["Front End", "Front End"]
		]
	end

end
