class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :day_to_ship

  with_options presence: true do
    validates :image,             message: '画像は必須です'
    validates :product_name,      message: '商品名は必須です'
    validates :description,       message: '商品の説明は必須です'
    validates :price,             message: '価格は必須です'
    validates :user_id
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id,       message: 'カテゴリーは必須です'
    validates :condition_id,      message: '商品の状態は必須です'
    validates :shipping_cost_id,  message: '配送料は必須です'
    validates :prefecture_id,     message: '発送元の地域は必須です'
    validates :day_to_ship_id,    message: '発送までの日数は必須です'
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                  format: { with: /\A[0-9]+\z/ }
end
