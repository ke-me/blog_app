class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # @user = User.new(name: params[:name], email: params[:email])
    if @user.save
      # flash[:notice] = "ユーザー登録が完了しました"
      # redirect_to("/users/#{@user.id}")
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  # private以下は、外部に晒されない
  private

    def user_params
      # :userは必須。:name, :email, :passwordを許可。それ以外は許可しない。
      params.require(:user).permit(:name, :email, :password)
    end
end
