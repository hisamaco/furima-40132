class OrdersController < ApplicationController
  def index
    @order_shipment = OrderShipments.new
  end

  def new
  end

  def create
  end
end
