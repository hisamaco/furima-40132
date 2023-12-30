class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :days_to_ship

  with_options presence: { message: 'は必須です' } do
    validates :image
    validates :product_name
    validates :description
    validates :price
    validates :user_id
  end

  with_options numericality: { other_than: 1, message: 'は必須です' } do
    validates :category_id
    validates :condition_id
    validates :shipping_cost_id
    validates :days_to_ship_id
    validates :prefecture_id
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                    format: { with: /\A[0-9]+\z/ }
end
