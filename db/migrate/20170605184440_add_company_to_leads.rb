class AddCompanyToLeads < ActiveRecord::Migration[5.0]
  def change
    add_column :leads, :company, :integer
  end
end
