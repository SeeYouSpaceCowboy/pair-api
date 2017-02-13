class CreateUserFriends < ActiveRecord::Migration[5.0]
  def change
    create_table :user_friends ,id: false do |t|
      t.integer :user_id
      t.integer :friend_id
      t.timestamps
    end
    add_index(:user_friends, [:user_id, :friend_id], :unique => true)
    add_index(:user_friends, [:friend_id, :user_id], :unique => true)
  end
end
