class UserStockSerializer < ActiveModel::Serializer
  attributes :id, :stock_id, :user_id, :stock_data
  belongs_to :user
  belongs_to :stock

  def stock_data
    self.object.stock
  end
end
