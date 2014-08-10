require 'link_header'

class CoursesController < ApplicationController

	def index
		@courses = Course.get_all_courses
		@link = @courses.headers['link']

		parsed_link = LinkHeader.parse(@link).to_a

		parsed_link.map do |item|
			
		end	

	end

	
end

