class FriendshipsController < ApplicationController
    before_action :set_user, only: %i[ create destroy ]
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def create
        
        # current_user = User.first
        following = User.find(params[:following_id])
        new_friendship = @current_user.friendships.build(following_id:following.id).save
        if new_friendship
            render json: @current_user.followings, each_serializer: UserSerializer
        else
            render json: {error: 'Not able to complete request'}, status: :unprocessable_entity
        end
    end

    def destroy
        friendship = @current_user.friendships.where(following_id: params[:id]).first
        friendship.destroy
        render json: @current_user.followings, each_serializer: UserSerializer
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
        token = request.headers["token"]
        user_id = decode_token(token)
        @current_user = User.find_by!(id: user_id)
      end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    def render_not_found_response
        render json: { error: "No user associated with this email. Please use a valid user email." }, status: :unprocessable_entity
    end
end
