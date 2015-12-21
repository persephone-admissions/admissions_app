class User < ActiveRecord::Base
  
  has_secure_password

  has_many :questionnaires, :dependent => :delete_all
  has_many :applications, :dependent => :delete_all

  def full_name 
    "#{first_name} #{last_name}"
  end

end