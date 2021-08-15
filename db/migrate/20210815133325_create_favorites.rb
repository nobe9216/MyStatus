class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|

      t.integer :user_id, default: '', null: false
      t.integer :status_id, default: '', null: false

      t.timestamps
    end
  end
end
