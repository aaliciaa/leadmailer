class AddHtmlToLead < ActiveRecord::Migration[5.0]
  def change
    add_column :leads, :html, :text
  end
end
