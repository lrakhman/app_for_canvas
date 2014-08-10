class CoursesController < ApplicationController

	def index
		@courses = Course.get_all_courses

		# @link = @courses.headers['link'].split(', ')
	end
end

