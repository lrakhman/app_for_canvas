class CoursesController < ApplicationController
	def index
		@courses = Course.get_all_courses(1)
		# @link = Course.get_all_courses(1).headers['link'].split(', ')[1]
	end
end

