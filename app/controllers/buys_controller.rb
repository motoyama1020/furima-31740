class BuysController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!, only: [:index, :move_to_index]
  before_action :move_to_index, only: :index

  def index
    @buy_address = BuyAddress.new
  end

  def create
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      pay_item
      @buy_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:buy_address).permit(:post_num, :prefecture_id, :city, :house_num, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def move_to_index
    redirect_to root_path if @item.buy.present? || current_user.id == @item.user_id
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price.to_s,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end
end
