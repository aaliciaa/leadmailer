class AddUserToLead < ActiveRecord::Migration[5.0]
  def change
    add_column :leads, :user, :references
  end
end
