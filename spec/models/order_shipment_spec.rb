require 'rails_helper'

RSpec.describe OrderShipment, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_shipment = FactoryBot.build(:order_shipment, user_id: user.id, item_id: item.id)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_shipment).to be_valid
      end
      it 'building_nameが空でも保存できる' do
        @order_shipment.building_name = nil
        expect(@order_shipment).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @order_shipment.user_id = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @order_shipment.item_id = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Item can't be blank")
      end
      it 'postal_codeが空だと保存できない' do
        @order_shipment.postal_code = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンがないと保存できない' do
        @order_shipment.postal_code = 1_234_567
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include('Postal code 「3桁ハイフン4桁」の半角数値で入力して下さい')
      end
      it 'prefecture_idが1だと保存できない' do
        @order_shipment.prefecture_id = 1
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できない' do
        @order_shipment.city = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("City can't be blank")
      end
      it 'street_addressが空だと保存できない' do
        @order_shipment.street_address = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Street address can't be blank")
      end
      it 'phone_numberが空だと保存できない' do
        @order_shipment.phone_number = nil
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberにハイフンがあると保存できない' do
        @order_shipment.phone_number = '123 - 1234 - 1234'
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include('Phone number 10桁以上11桁以内の半角数値で入力して下さい')
      end
      it 'phone_numberが9桁以下だと保存できない' do
        @order_shipment.phone_number = 123_123_123
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include('Phone number 10桁以上11桁以内の半角数値で入力して下さい')
      end
      it 'phone_numberが12桁以上だと保存できない' do
        @order_shipment.phone_number = 123_123_123_123
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include('Phone number 10桁以上11桁以内の半角数値で入力して下さい')
      end
      it 'tokenが空では登録できない' do
        @order_shipment.token = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
