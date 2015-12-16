json.array!(@students) do |student|
  json.extract! student, :id, :first_name, :last_name, :email, :phone_number, :street_address, :city, :state, :country, :password_digest
  json.url student_url(student, format: :json)
end
