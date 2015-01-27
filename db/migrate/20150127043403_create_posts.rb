class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :place
      t.string :neighborhood
      t.time :when
      t.text :description

      t.timestamps null: false
    end
  end
end
