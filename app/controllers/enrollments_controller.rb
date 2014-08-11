class EnrollmentsController < ApplicationController
	def index
		
	end
	def create
		course_id = params[:id]
		enroll_response = HTTParty.post("http://canvas-api.herokuapp.com/api/v1/courses/#{course_id}/enrollments", query: {access_token: '9be624b4d5206a178fc56921d5bf2c2a'})
		logger.info "#{course_id}******************"
		logger.info "#{enroll_response}===================="
		redirect_to root_path
	end
end
