class MicropostsController < ApplicationController
    before_action :loggend_in_user,only: [:create]
    
    def create
        #現在のユーザと結びついたフィルタリングされている投稿をインスタンス化
        @micropost = current_user.microposts.build(micropost_params)
        if @micropost.save
            flash[:success] = "Micropost created!"
            redirect_to root_url
        else
            render 'static_pages.home'
        end
    end
    
    private
    
    def micropost_params
        params.require(:micropost).permit(:content)
    end
end