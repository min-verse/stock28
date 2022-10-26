class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email
  
  has_many :user_stocks
  has_many :stocks, through: :user_stocks

  has_many :friendships
  has_many :followings, through: :friendships
end
