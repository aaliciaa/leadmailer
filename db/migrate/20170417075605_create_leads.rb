class CreateLeads < ActiveRecord::Migration[5.0]
  def change
    create_table :leads do |t|
      t.string :name
      t.string :email
      t.datetime :received_at
      t.datetime :accepted_at
      t.string :status
      t.string :source
      t.string :phone
      t.float :response_time
      t.text :html
      t.references :user
      t.references :customer

      t.timestamps
    end
  end
end
