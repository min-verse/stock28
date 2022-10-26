class UserStocksController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    rescue_from JWT::ExpiredSignature, with: :expired_token_response

    def create
        token = request.headers["token"]
        user_id = decode_token(token)
        user = User.find_by!(id:user_id)
        unless user.can_track_stock?(params[:ticker])
            render json: {error: "User is unable to add this stock. Please check your portfolio items and size."}
        end
        #checks to see if the stock is already in database
        stock = Stock.check_db(params[:ticker])
        # if the stock doesn't exist in database, then add it to database
        if stock.blank?
            searched_stock = Stock.new_lookup(params[:ticker])
            unless searched_stock.is_a? String
                result = Stock.search_stock(query)
                new_stock = Stock.create(ticker:query, name:result['name'], description:result['description'])
                HistoricalStockDatum.record_data(query)
                @user_stock = UserStock.create(user:user, stock:new_stock)
                render json: user.stocks
            end
        end

        @user_stock = UserStock.create(user:user, stock:stock)
        render json: user.stocks
    end

    def destroy
        token = request.headers["token"]
        delete_user_id = decode_token(token)
        stock = Stock.find(params[:id])
        #replace 3 with user_id once authentication is set up
        user_stock = UserStock.where(user_id:delete_user_id, stock:stock).first
        user_stock.destroy
    end

    def refresh
        token = request.headers["token"]
        user_id = decode_token(token)
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
