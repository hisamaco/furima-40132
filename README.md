# README

## usersテーブル

| Column             | type   | options                   |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :products
- has_many :purchases

## productsテーブル
| Column             | type       | options                        |
|--------------------|------------|--------------------------------|
| product_name       | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| shipping_cost_id   | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| days_to_ship_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase
- belongs_to :category
- belongs_to :condition
- belongs_to :shipping_cost
- belongs_to :prefecture
- belongs_to :days_to_ship

## purchasesテーブル

| Column  | type       | options                        |
|---------|------------|--------------------------------|
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :shipment

## shipmentsテーブル
| Column          | type       | options                        |
|-----------------|------------|--------------------------------|
| postal_code     | string     | null: false                    |
| prefecture      | integer    | null: false, foreign_key: true |
| city            | string     | null: false                    |
| street_address  | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |
| purchase        | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase
- belongs_to :prefecture
