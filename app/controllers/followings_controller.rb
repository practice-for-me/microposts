class FollowingsController < ApplicationController
    
    def show
        @users = current_user.following_users
    end
end
