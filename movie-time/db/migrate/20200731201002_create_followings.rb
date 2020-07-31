class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.references :follower, null: false, foreign_key: true
      t.references :followed, null: false, foreign_key: true

      t.timestamps
    end
    add_foreign_keys :followings, :users, column: follower_id
    add_foreign_keys :followings, :users, column: followed_id
    add_index :followings, [:follower_id, :followed_id], unique:true
  end
end
