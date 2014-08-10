class CoursesController < ApplicationController

	def index
		@courses = Course.get_all_courses
		@link = @courses.headers['link']

		parsed_link = LinkHeader.parse(@link).to_a

		parsed_link.map do |item|
			position = item[1][0][1]
			if position == "first"
        @first_page = item[0]
      elsif position == "prev"
        @prev_page = item[0]
      elsif position == "next"
        @next_page = item[0]
      elsif position == "last"
        @last_page = item[0]
      end
		end	


	end

	def show
    @home_page = params[:page]

    @response = Course.get_all_courses.parsed_response

    @response.each do |course| 
    	if course['id'] == params[:id]
    	@course_id = course
    	end
    end
  end

	
end

