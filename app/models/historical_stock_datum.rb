class HistoricalStockDatum < ApplicationRecord
    belongs_to :stock

    def self.record_data(ticker_symbol)
        @found_stock = Stock.find_by(ticker: ticker_symbol)
        if @found_stock
            historical_data = Stock.new_lookup(ticker_symbol)
            historical_data.map do |data|
                formatted_date = data['date'].slice(0,10)
                HistoricalStockDatum.create(date:formatted_date, price:data['close'], stock:@found_stock)
            end
        end
    end
end