class UsersController < ApplicationController
    before_action :set_user, only: %i[ show update destroy ]
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    rescue_from JWT::ExpiredSignature, with: :expired_token_response
  
    # GET /users
    def index
      @users = User.all
      render json: @users
    end
  
    # GET /users/1
    def show
      render json: @user
    end
  
    def login
      p params[:email]
      p params[:password]
      user = User.find_by(email:params[:email]).try(:authenticate, params[:password])
      p user
      if user
        token = generate_token(user.id)
        render json: {user:UserSerializer.new(user), 
          token:token, 
          stocks:ActiveModel::Serializer::CollectionSerializer.new(user.stocks, each_serializer: StockSerializer), 
          followings:ActiveModel::Serializer::CollectionSerializer.new(user.followings, each_serializer: UserSerializer)}, status: :ok
      else
        render json: {error:"User with these credentials does not exist."}, status: 401
      end
    end
    
    def profile
        token = request.headers["token"]
        user_id = decode_token(token)
        user = User.find(user_id)
        render json: {user:UserSerializer.new(user),
          stocks:ActiveModel::Serializer::CollectionSerializer.new(user.stocks, each_serializer: StockSerializer), 
          followings:ActiveModel::Serializer::CollectionSerializer.new(user.followings, each_serializer: UserSerializer)}, status: :ok
    end
  
    # POST /users
    def create
      if params[:password] == params[:confirmPassword]
      user = User.create!(first_name: params[:firstName], last_name:params[:lastName], email: params[:email], password: params[:password])
      token = generate_token(user.id)
      render json: {user:UserSerializer.new(user), token:token, stocks:ActiveModel::Serializer::CollectionSerializer.new(user.stocks, each_serializer: StockSerializer)}
      else
        render json: {errors: ["Passwords do not match"]}
      end
    end
  
    # PATCH/PUT /users/1
    def update
      token = request.headers["token"]
      user_id = decode_token(token)
      puts params
      
      user = User.find_by!(id: user_id)
      # render json: User.find_by!(id: user_id)
      if(params[:email] == user.email && user.try(:authenticate, params[:password])) 
        user.update!(update_user_params)
        render json: user
      else
        render json: {error: "User could not be updated"}, status: :unprocessable_entity
      end
    end
  
    # DELETE /users/1
    def destroy
      token = request.headers["token"]
      user_id = decode_token(token)
      temp = User.find_by!(email:params[:email])
      if user_id == params[:id].to_i && temp.id == user_id
        if params[:password] != params[:confirmPassword]
          render json: {error: "Passwords do not match."}, status: :unauthorized
        else
          user = User.find_by!(email:params[:email]).try(:authenticate, params[:password])
          if user
            user = User.find_by!(id:user_id)
            friendships_followee = Friendship.where(following_id:user_id)
            friendships_follower = Friendship.where(user_id:user_id)
            friendships_followee.destroy_all
            friendships_follower.destroy_all
            user.destroy
            render json: {}, status: :ok
          else
            render json: {error: "Incorrect password"}, status: :unauthorized
          end
        end
      else
        render json: {error: "You do not have permission to delete this person's profile"}, status: :unauthorized
      end
    end
  
    def example_get
      user = User.find_by(id:params[:id])
      render json: {user:user, stocks:ActiveModel::Serializer::CollectionSerializer.new(user.stocks, each_serializer: StockSerializer)}
    end
  
    # ---------------------Stock Methods----------------- #
    def my_portfolio
      token = request.headers["token"]
      user_id = decode_token(token)
      user = User.find_by!(id:user_id)
      @tracked_stocks = user.stocks
      render json: @tracked_stocks, status: :ok
    end
  
    def my_friends
      token = request.headers["token"]
      user_id = decode_token(token)
      if user_id == params[:id]
        user = User.find_by!(id: user_id)
        friends = user.friends
        render json: friends, status: :ok
      end
    end
  
    def search_users
        if params[:friend_search].present?
          token = request.headers["token"]
          user_id = decode_token(token)
          current_user = User.find_by!(id: user_id)
            @friends = User.search(params[:friend_search])
            @friends = current_user.except_current_user(@friends)
            if @friends.length() > 0
                render json: @friends
            else
                render json: {error: "No user found"}
            end
        else
            render json: {error: "Search field must not be blank to search"}
        end
    end
  
    def refresh_portfolio
      token = request.headers["token"]
      user_id = decode_token(token)
      user = User.find(user_id)
      if user
        user.refresh_stocks
        render json: user.stocks, status: :ok
      else
        render json: {error: "User not in our system."}, status: :not_found
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end
  
      def verify_user
  
      end
  
      # Only allow a list of trusted parameters through.
      def user_params
        params.require(:user).permit(:email, :password_digest)
      end
  
      def register_user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password_digest)
      end
  
      def update_user_params
        params.permit(:email, :first_name, :last_name, :password)
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
