class FollowersController < ApplicationController
    
    def show
        @users = current_user.follower_users
    end
    
end
