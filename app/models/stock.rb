class Stock < ApplicationRecord
        has_many :user_stocks, dependent: :destroy
        has_many :users, through: :user_stocks
    
        has_many :historical_stock_data, dependent: :destroy
    
        require 'uri'
        require 'net/http'
        @key = Rails.application.credentials.tiingo[:api_key]
    
        def self.new_lookup(ticker_symbol)
            uri = URI("https://api.tiingo.com/tiingo/daily/#{ticker_symbol}/prices?startDate=2022-07-01&token=#{@key}")
            res = Net::HTTP.get_response(uri)
            if res.is_a?(Net::HTTPSuccess)
                # this gets you the whole damn intraday data, remember to pick out your deserved info on the frontend
                # or just make more methods on the backend to specifically access certain attributes
                JSON.parse(res.body)
            else
                return "Error, response was not received"
            end
        end
    
        def self.search_stock(ticker_symbol)
            stock = self.find_by(ticker:ticker_symbol)
            if stock
                JSON.parse(stock)
            else
                uri = URI("https://api.tiingo.com/tiingo/daily/#{ticker_symbol}?token=#{@key}")
                res = Net::HTTP.get_response(uri)
                found_stock = JSON.parse(res.body)
                if found_stock['detail']
                    return found_stock['detail']
                else
                    found_stock
                end
            end
        end
    
        def self.check_db(ticker_symbol)
            self.where(ticker: ticker_symbol).first
        end
    
        # MODIFY THIS METHOD TO REFRESH STOCKS FOR USERS WHENEVER THEY CLICK 'REFRESH ALL'
        def add_to_historical
            latest = self.historical_stock_data.max_by {|item| item.date}
            api_key = Rails.application.credentials.tiingo[:api_key]
            uri = URI("https://api.tiingo.com/tiingo/daily/#{self['ticker']}/prices?startDate=#{latest.date}&token=#{api_key}")
            res = Net::HTTP.get_response(uri)
            if res.is_a?(Net::HTTPSuccess)
                additional_data = JSON.parse(res.body)
                additional_data.map do |data|
                    if data['date'].slice(0,10) != latest.date
                        formatted_date = data['date'].slice(0,10)
                        HistoricalStockDatum.create(date:formatted_date, price:data['close'], stock:self)
                    end
                end
            else
                return "Error, response was not received"
            end
        end
    
        def self.get_stock_history(ticker_symbol)
            @stocks_history = Stock.find_by(ticker:ticker_symbol).historical_stock_data.max_by(10) {|item| item.date}
            @stocks_history
        end
    
        def history
            self.historical_stock_data.max_by(10) {|item| item.date}
        end

end
