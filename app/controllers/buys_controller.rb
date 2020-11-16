class BuysController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :move_to_index, only: :index

  def index
    @buy_address = BuyAddress.new
  end

  def create
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      @buy_address.save
      redirect_to 'items/index'
    else
      render action: :index
    end
  end

  private
  def buy_params
    params.require(:buy_address).permit(:user_id, :item_id, :post_num, :prefecture_id, :city, :house_num, :building, :phone)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in? && current_user.id 
  end

end