class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|

      t.integer :user_id, default: 0, null: false
      t.integer :status_id, default: 0, null: false
      t.text :comment

      t.timestamps
    end
  end
end
