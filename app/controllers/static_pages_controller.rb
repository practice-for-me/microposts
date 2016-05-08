class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      #ユーザ情報も投稿と一緒にまとめて取得
      @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc)
    end
  end
end
