class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :description, :price, :category_id, :condition_id, :shipping_cost_id,
                                 :prefecture_id, :days_to_ship_id).merge(user_id: current_user.id)
  end
end
