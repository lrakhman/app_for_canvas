require 'net/http'
class CoursesController < ApplicationController
	include HTTParty
  base_uri 'canvas-api.herokuapp.com'
  default_params page: @page, access_token: '9be624b4d5206a178fc56921d5bf2c2a'

	def index
		@courses = Course.get_all_courses(@page)

		# @link = @courses.headers['link'].split(', ')
	end
end

