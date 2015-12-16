json.array!(@applications) do |application|
  json.extract! application, :id, :notes, :student_id, :course_id, :status_id
  json.url application_url(application, format: :json)
end
