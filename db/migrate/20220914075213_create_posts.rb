class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.timestamps
      t.string :title
      t.text :body
      t.integer :customer_id
    end
  end
end
