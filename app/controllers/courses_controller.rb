class CoursesController < ApplicationController

	def index
		@courses = Course.get_all_courses(params[:page] || 1)
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
    next_course_query = @next_page.split('?')[1] if @next_page
   
    #set variables depending on page num
   	@prev_course_info = @prev_page.nil? ? nil : prev_course_query.length > 1 ? CGI::parse(prev_course_query)['page'][0] : nil
    @next_course_info = @next_page.nil? ? nil : next_course_query.length > 1 ? CGI::parse(next_course_query)['page'][0] : nil
	end

	def show
    @home_page = params[:page]
    @response = HTTParty.get('http://canvas-api.herokuapp.com/api/v1/courses/'+ params[:id], query: {access_token: '9be624b4d5206a178fc56921d5bf2c2a'})
  end

	
end

