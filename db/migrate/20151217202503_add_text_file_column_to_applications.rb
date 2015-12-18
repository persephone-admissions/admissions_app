class AddTextFileColumnToApplications < ActiveRecord::Migration

  def change
    add_attachment :applications, :text_file
  end

end
