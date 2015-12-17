class AddStatusToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :status_id, :integer
  end
end
