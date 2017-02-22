class User < ApplicationRecord
  validates :username, :email, presence: true, uniqueness: true

  has_secure_password

  has_many :comments
  has_many :stock_users
  has_many :stocks, through: :stock_users


  has_and_belongs_to_many :user_followers,
    class_name: "User",
    join_table: :user_followers,
    foreign_key: :user_id,
    association_foreign_key: :followee_id

  has_and_belongs_to_many :user_following,
    class_name: "User",
    join_table: :user_following,
    foreign_key: :user_id,
    association_foreign_key: :followee_id

end
