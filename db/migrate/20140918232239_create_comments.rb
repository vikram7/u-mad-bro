class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.text :comment, null: false
      t.integer :karma, null: false
      t.boolean :mad, null: false

      t.timestamps
    end
  end
end
