class CreateStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses do |t|

      t.integer :user_id
      t.integer :favorite_id
      t.integer :comment_id
      t.date :date, default: '', null: false
      t.float :weight, default: '', null: false
      t.float :fat
      t.text :breakfast
      t.text :lunch
      t.text :dinner
      t.text :snacks
      t.text :memo

      t.timestamps
    end
  end
end
