class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # sessions_helperで作成したメソッド log_in
      log_in user
      redirect_to user
    else
      flash[:danger] = 'ログインに失敗しました'
      # render 'new'だとエラーが出たので、下記に直した
      redirect_to action: :new
    end
  end

  def destroy
    # log_out
    redirect_to root_url
  end
end
