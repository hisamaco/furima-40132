class OrdersController < ApplicationController
  def index
    @order_shipment = OrderShipments.new
    @item = Item.find(params[:item_id])
  end

  def new
  end

  def create
  end
end
