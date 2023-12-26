# README

## usesテーブル

| Column          | type   | options                   |
|-----------------|--------|---------------------------|
| nickname        | string | null: false               |
| email           | string | null: false, unique: true |
| password        | string | null: false               |
| last_name       | string | null: false               |
| first_name      | string | null: false               |
| last_name_kana  | string | null: false               |
| first_name_kana | string | null: false               |
| birthday        | string | null: false               |

### Association

- belongs_to :products
- belongs_to :shipments

## productsテーブル
| Column          | type       | options                        |
|-----------------|------------|--------------------------------|
| product_name    | string     | null: false                    |
| description     | string     | null: false                    |
| category        | string     | null: false                    |
| condition       | string     | null: false                    |
| shipping_cost   | string     | null: false                    |
| origin_location | string     | null: false                    |
| days_to_ship    | string     | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- has_many :users
- has_one :shipments

## shipmentsテーブル
| Column          | type       | options                        |
|-----------------|------------|--------------------------------|
| postal_code     | string     | null: false                    |
| prefecture      | string     | null: false                    |
| city            | string     | null: false                    |
| street_address  | string     | null: false                    |
| building_name   | string     | null: false                    |
| phone_number    | string     | null: false                    |
| product         | references | null: false, foreign_key: true |
| user            | references | null: false, foreign_key: true |

### Association

- has_many :users
- belongs_to :products