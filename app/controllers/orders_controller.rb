class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
    @order = Order.all
    # 出品者、または 購入済み商品ページに飛んだ時
    if @item.user_id == current_user.id || @order.exists?(item_id: @item.id)
      redirect_to root_url
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)

    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(item_id: @item.id, user_id: current_user.id)
  end


end
