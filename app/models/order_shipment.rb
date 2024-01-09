class OrderShipment
  include ActiveModel::Model

  attr_accessor :postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: '「3桁ハイフン4桁」の半角数値で入力して下さい' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :street_address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: '10桁以上11桁以内の半角数値で入力して下さい' }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Shipment.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street_address: street_address,
                    building_name:, phone_number: phone_number, order_id: order.id)
  end
end
