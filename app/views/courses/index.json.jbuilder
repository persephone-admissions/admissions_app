json.array!(@courses) do |course|
  json.extract! course, :id, :start_on, :end_on, :description, :city
  json.url course_url(course, format: :json)
end
