class ShopsController < ApplicationController

  before_action :correct_user,only: [:destroy]
  
  def index
    @shops=Shop.all
  end

  def show
    @shop=Shop.find(params[:id])
  end

  def new
    @shop=Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      flash[:success] = 'Shop が正常に投稿されました'
      redirect_to :shops
    else
      flash.now[:danger] = 'Shop が投稿されませんでした'
      render :new
    end
  end

  def edit
    @shop=Shop.find(params[:id])
  end

  def update
    @shop=Shop.find(params[:id])
    if @shop.update(shop_params)
      flash[:success] = 'Shopは正常に更新されました'
      redirect_to :shop
     else
      flash.now[:danger] = 'Shopは更新されませんでした'
      render :edit
    end
  end

  def destroy
    @shop.destroy

    flash[:success] = 'Shop は正常に削除されました'
    redirect_to :shops
  end
  
  def shop_params
    params.require(:shop).permit(:name, :picture, :introduction, :time, :holiday, :phone, :user_id, :address, :latitude, :longitude)
  end
  
  def correct_user
    @shop = current_user.shops.find_by(id: params[:id])
    unless @shop
      redirect_to root_url
    end
  end
  
end
