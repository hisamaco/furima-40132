class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_shipment = OrderShipment.new
  end

  def create
    @item = Item.find(params[:item_id])
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
end
