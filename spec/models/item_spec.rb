require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do
    context '商品が新規登録できる場合' do
      it '全ての必要事項が入力されていると登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が新規登録できない場合' do
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Image は必須です')
      end
      it 'product_nameが空では保存できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Product name は必須です')
      end
      it 'descriptionが空では保存できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Description は必須です')
      end
      it 'priceが空では保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は必須です')
      end
      it 'category_idが1では保存できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category は必須です')
      end
      it 'condition_idが1では保存できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition は必須です')
      end
      it 'shipping_cost_idが1では保存できない' do
        @item.shipping_cost_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping cost は必須です')
      end
      it 'days_to_ship_idが1では保存できない' do
        @item.days_to_ship_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Days to ship は必須です')
      end
      it 'prefecture_idが1では保存できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture は必須です')
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it 'priceは300より少ない場合は登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceは9_999_999より多い場合は登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'priceは全角を含むと登録できない' do
        @item.price = '１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceは記号を含むと登録できない' do
        @item.price = '¥1111'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceは半角英字を含むと登録できない' do
        @item.price = 'a1111'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
