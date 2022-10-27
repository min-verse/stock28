class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    require 'uri'
    require 'net/http'
    

    def get_news
        @key = Rails.application.credentials.finnhub[:api_key]
        uri = URI("https://finnhub.io/api/v1/news?category=business&token=#{@key}")
        res = Net::HTTP.get_response(uri)
        render json: res.body
    end

    def get_secret_key
        @secret = Rails.application.credentials.secret_key[:secret]
        return @secret.to_s
    end

    def generate_token(user_id)
      JWT.encode({user_id:user_id, exp:Time.now.to_i + 3 * 24 * 3600 }, get_secret_key)
    end

    def decode_token(token)
      JWT.decode(token, get_secret_key)[0]["user_id"]
    end

    private

    def render_not_found_response(exception)
      render json: { error: "#{exception.model} not found" }, status: :not_found
    end
  
    def render_unprocessable_entity_response(exception)
      render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end
end
