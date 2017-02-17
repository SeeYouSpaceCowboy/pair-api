class CreateUserFollowing < ActiveRecord::Migration[5.0]
  def change
    create_table :user_following ,id: false do |t|
      t.integer :user_id
      t.integer :followee_id
      t.timestamps
    end
    add_index(:user_following, [:user_id, :followee_id], :unique => true)
    add_index(:user_following, [:followee_id, :user_id], :unique => true)
  end
end
