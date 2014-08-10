class Course
	include HTTParty
  base_uri 'canvas-api.herokuapp.com'
  # these default params are not working
  # default_params page: @page, access_token: '9be624b4d5206a178fc56921d5bf2c2a'


  def self.get_all_courses
    get("/api/v1/courses?", :query => { page: @page, access_token: '9be624b4d5206a178fc56921d5bf2c2a' })
  end

  
end