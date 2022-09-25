class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.integer :room_id
      t.integer :customer_id
      t.timestamps
    end
  end
end
