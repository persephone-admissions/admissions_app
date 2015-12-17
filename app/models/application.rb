class Application < ActiveRecord::Base
  belongs_to :student #change column to student_id
  belongs_to :course
  belongs_to :status
  has_many :answers

  has_attached_file :text_file, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :text_file, content_type: /\Atext\/.*\Z/

end
