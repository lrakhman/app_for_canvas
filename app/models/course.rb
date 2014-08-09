class Course
	include HTTParty
  base_uri 'http://canvas-api.herokuapp.com'

  def self.get_all_courses(page)
    get("/api/v1/courses?access_token=#{token}&page=#{page}")
  end

   def self.token
    post("/api/v1/tokens")['token']
  end
end
