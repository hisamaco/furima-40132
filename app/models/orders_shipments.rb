class OrderShipments
  include ActiveModel::Model
  attr_accessor :potal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code
    validates :prefecuture_id
    validates :city
    validates :street_address
    validates :phone_number
    validates :user_id
    validates :item_id
  end

  def save
    # 寄付情報を保存し、変数donationに代入する
    orders = Orders.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Shipments.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street_address: street_address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end
