class AddColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :manager, :boolean, default: false
    add_column :users, :name, :string
    add_column :users, :rank, :integer
    add_column :users, :photo, :string
    add_column :users, :available, :boolean, default: true
    add_reference :users, :customer, index: true
  end
end
