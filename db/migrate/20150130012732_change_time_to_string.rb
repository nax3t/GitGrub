class ChangeTimeToString < ActiveRecord::Migration
  def change
  	change_column(:posts, :time, :string)
  end
end
