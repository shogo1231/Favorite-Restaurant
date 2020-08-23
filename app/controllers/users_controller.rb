class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show]
  def show
    @user = User.find(params[:id])
    if @user==current_user
      @shop=@user.shops 
    else
      redirect_to :shops
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to :login
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
