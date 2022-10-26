class StocksController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from JWT::ExpiredSignature, with: :expired_token_response

    def search
        token = request.headers["token"]
        user_id = decode_token(token)
        query = params[:ticker].upcase
        stock = Stock.find_by(ticker:query)
        user = User.find_by!(id:user_id)
        if stock
          if user.stock_already_tracked?(query)
            
            render json: {stock: StockSerializer.new(stock), error: "Stock already in portfolio"}
          elsif user.stocks.count >= 5
            render json: {stock: StockSerializer.new(stock), error: "Portfolio already at maximum size (5)"}
          else
            render json: {stock: StockSerializer.new(stock)}
          end
        else
          # create a stock object after a look up and also pull history data for the newly created stock object
          # return the stock object and history in one json object
          result = Stock.search_stock(query)
          if result.is_a? String
            render json: {error: "Stock with ticker symbol #{query} could not be found. Please attempt another query."}
          else
            new_stock = Stock.create(ticker:query, name:result['name'], description:result['description'])
            HistoricalStockDatum.record_data(query)
            render json: {stock: StockSerializer.new(new_stock)}
          end
        end
    end

    def show
      stock = Stock.find(params[:id])
      render json: stock
    end

    def stock_history
        @stocks_history = Stock.find_by(ticker:params[:ticker]).historical_stock_data.max_by(10) {|item| item.date}
        render json: @stocks_history
    end

    def refresh_data
      stock = Stock.find_by!(id: params[:id])
      stock.add_to_historical
      refreshed_stock = Stock.find(params[:id])
      render json: refreshed_stock
    end

    private

      # Use callbacks to share common setup or constraints between actions.
      def set_stock
        @stock = Stock.find_by(ticker:params[:ticker])
      end
  
      # Only allow a list of trusted parameters through.
      def stock_params
        params.require(:stock).permit(:ticker)
      end
  
      def register_stock_params
        params.require(:stock).permit(:ticker, :latest_price)
      end

      def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
      end
  
      def render_not_found_response
        render json: { error: "No user associated with this email. Please use a valid user email." }, status: :unprocessable_entity
      end
  
      def expired_token_response
        render json: {error: "Token has expired"}, status: :unauthorized
      end
end
