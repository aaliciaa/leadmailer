class CreateLeads < ActiveRecord::Migration[5.0]
  def change
    create_table :leads do |t|
      t.string :name
      t.string :email
      t.string :recieved_at
      t.string :accepted_at
      t.string :status
      t.string :source
      t.references :user

      t.timestamps
    end
  end
end
