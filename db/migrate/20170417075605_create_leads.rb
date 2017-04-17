class CreateLeads < ActiveRecord::Migration[5.0]
  def change
    create_table :leads do |t|
      t.string :name
      t.string :email
      t.datetime :recieved_at
      t.datetime :accepted_at
      t.string :status
      t.string :source
      t.references :user

      t.timestamps
    end
  end
end
