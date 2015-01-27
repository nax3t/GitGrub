class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :place
      t.string :neighborhood
      t.time :time
      t.text :body
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
