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

  
    prev_course_query = @prev_page.split('?')[1] if @prev_page #everything after the ?
    @next_course_query = @next_page.split('?')[1] if @next_page
   
   	@prev_course_info = @prev_page.nil? ? nil : prev_course_query.length > 1 ? params[:page].to_i : nil
    @next_course_info = @next_page.nil? ? nil : @next_course_query.length > 1 ? params[:page].to_i : nil

	end

	def show
    @home_page = params[:page]

    response = Course.get_all_courses.parsed_response
    response.each do |course| 
    	@course_id = course if course['id'] == params[:id].to_i
    end
  end

	
end

