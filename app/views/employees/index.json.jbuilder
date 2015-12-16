json.array!(@employees) do |employee|
  json.extract! employee, :id, :first_name, :last_name, :type, :email, :password_digest
  json.url employee_url(employee, format: :json)
end
