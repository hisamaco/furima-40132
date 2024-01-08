class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :access_rejection, only: [:index, :create]

  def index
    @order_shipment = OrderShipment.new
  end

  def create
    @order_shipment = OrderShipment.new(order_params)
    if @order_shipment.valid?
      @order_shipment.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_shipment).permit(:postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number)
          .merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def access_rejection
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end
end
