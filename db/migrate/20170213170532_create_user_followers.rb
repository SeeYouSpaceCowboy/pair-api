class CreateUserFollowers < ActiveRecord::Migration[5.0]
  def change
    create_table :user_followers ,id: false do |t|
      t.integer :user_id
      t.integer :followee_id
      t.timestamps
    end
    add_index(:user_followers, [:user_id, :followee_id], :unique => true)
    add_index(:user_followers, [:followee_id, :user_id], :unique => true)
  end
end
