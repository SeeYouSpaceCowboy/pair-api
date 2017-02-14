class User < ApplicationRecord
  has_secure_password

  has_many :comments 
  has_many :stock_users
  has_many :stocks, through: :stock_users


  has_and_belongs_to_many :user_friends,
    class_name: "User",
    join_table: :user_friends,
    foreign_key: :user_id,
    association_foreign_key: :friend_id

end
