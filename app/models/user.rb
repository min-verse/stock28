class User < ApplicationRecord
    has_secure_password
    has_many :user_stocks, dependent: :destroy
    has_many :stocks, through: :user_stocks
    
    has_many :friendships, dependent: :destroy
    has_many :followings, through: :friendships

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :first_name, presence: true, 
                  length: {minimum:3, maximum:25}
    validates :last_name, presence: true, 
                  length: {minimum:3, maximum:25}
    validates :email, presence: true, 
                uniqueness: {case_sensitive: false},
                format: {with: VALID_EMAIL_REGEX}
    validates :password, presence: true

    def under_stock_limit?
      stocks.count <= 5
    end
  
    def stock_already_tracked?(ticker_symbol)
      stock = Stock.check_db(ticker_symbol)
      # returns false if there is no such stock in the database
      return false unless stock
      # otherwise we return this boolean value to see if 
      # the stock exists within the user's tracked stocks
      stocks.where(id: stock.id).exists?
    end
  
    def can_track_stock?(ticker_symbol)
      under_stock_limit? && !stock_already_tracked?(ticker_symbol)
    end
  
    def full_name
      "#{first_name} #{last_name}" if first_name || last_name
      "Anonymous"
    end

    def refresh_stocks
      if stocks
        stocks.map do |stock|
          stock.add_to_historical
        end
      else
        render json: {error: "No stocks in your portfolio. Please add some to get started!"}
      end
    end
  
    def self.search(param)
        param.strip!
        results = (first_name_matches(param) + last_name_matches(param) + email_matches(param)).uniq
        return nil unless results
        results
    end
  
    def self.first_name_matches(param)
        self.matches("first_name", param)
    end
  
    def self.last_name_matches(param)
        self.matches("last_name", param)
    end
  
    def self.email_matches(param)
        self.matches("email", param)
    end
  
    def self.matches(field_name, param)
        where("#{field_name} like ?", "%#{param}%")
    end
  
    def except_current_user(users)
      users.reject{|user| user.id == self.id }
    end
  
end
