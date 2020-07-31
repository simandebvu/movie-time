class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.references :follower, null: false, foreign_key: true
      t.references :followed, null: false, foreign_key: true

      t.timestamps
    end
  end
end
