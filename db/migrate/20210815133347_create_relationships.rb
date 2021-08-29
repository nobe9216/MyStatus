class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|

      t.integer :followed_id, default: 0, null: false
      t.integer :follower_id, default: 0, null: false

      t.timestamps
    end
  end
end
