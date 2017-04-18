class AddResponsetimeToLeads < ActiveRecord::Migration[5.0]
  def change
    add_column :leads, :response_time, :float
  end
end
