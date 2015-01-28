class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.references :post #post it's attached to
    	t.references :user #user that created it
    	t.string :comment_body
    end
  end
end
