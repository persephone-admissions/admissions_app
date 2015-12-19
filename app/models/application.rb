class Application < ActiveRecord::Base
  belongs_to :student
  belongs_to :course
  belongs_to :status
  has_many :answers

  has_attached_file :text_file
  validates_attachment_file_name :text_file, matches: [/doc\Z/, /txt\Z/, /docx\Z/, /pdf\Z/, /rtf\Z/]

end
