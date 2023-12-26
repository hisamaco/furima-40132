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

- belongs_to :product
- belongs_to :shipment

## productsテーブル
| Column          | type       | options                        |
|-----------------|------------|--------------------------------|
| product_name    | string     | null: false                    |
| description     | text       | null: false                    |
| category        | integer    | null: false, foreign_key: true |
| condition       | integer    | null: false, foreign_key: true |
| shipping_cost   | integer    | null: false, foreign_key: true |
| prefecture      | integer    | null: false, foreign_key: true |
| days_to_ship    | integer    | null: false, foreign_key: true |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :shipment
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

## shipmentsテーブル
| Column          | type       | options                        |
|-----------------|------------|--------------------------------|
| postal_code     | string     | null: false                    |
| prefecture      | string     | null: false                    |
| city            | string     | null: false                    |
| street_address  | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |
| product         | references | null: false, foreign_key: true |
| user            | references | null: false, foreign_key: true |

### Association

- has_many :users
- belongs_to :products