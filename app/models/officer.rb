class Officer < User

  has_and_belongs_to_many :courses
  has_many :answers
  

    def applications
  	 courses.map do |course|
  		course.applications
  	
  	 end 
  end

end