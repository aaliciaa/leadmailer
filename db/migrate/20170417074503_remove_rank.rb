class RemoveRank < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :rank, :string
  end
end
