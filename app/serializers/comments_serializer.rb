class CommentsSerializer < ActiveModel::Serializer
  attributes :message, :user_id, :stock_id
end 
