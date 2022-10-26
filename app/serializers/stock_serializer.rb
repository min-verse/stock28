class StockSerializer < ActiveModel::Serializer
  attributes :id, :ticker, :name, :description, :history
  # has_many :historical_stock_data
  # has_many :user_stocks
  # has_many :users, through: :user_stocks

  def history
    self.object.historical_stock_data.max_by(10) {|item| item.date}
  end
end
