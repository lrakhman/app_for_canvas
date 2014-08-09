class CoursesController < ApplicationController
	def index
		@courses = Course.get_all_courses(1)
		@courses2 = Course.get_all_courses(2)
		@courses3 = Course.get_all_courses(3)
		@courses4 = Course.get_all_courses(4)
		# @the_number_we_want = Course.get_all_courses(1).headers['link'].split(', ')[1]
	end
end
