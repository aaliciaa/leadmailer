class CreateLineups < ActiveRecord::Migration[5.0]
  def change
    create_table :lineups do |t|
      t.text :lineup

      t.timestamps
    end
  end
end
