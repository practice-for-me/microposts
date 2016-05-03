class SessionsController < ApplicationController
  def new
  end
  
  def create
    #もしユーザが入らなかったらnilが入る　この場合emailからユーザを探している
    @user = User.find_by(email: params[:session][:email].downcase)
    # @user!=nil &&  フォームで入力したpassword == 登録されたユーザのカラムであるpassword
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:info] = "logged in as #{@user.name}"
      redirect_to @user
    else
      #警告のフラッシュメッセージ
      flash[:danger] = 'invalid email/password combination'
      #newテンプレートの表示
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
