## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| year               | integer | null: false               |
| month              | integer | null: false               |
| day                | integer | null: false               |


### Association

has_many :items
has_many :deals
has_many :orders


## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| name                   | string     | null: false                    |
| explanation            | text       | null: false                    |
| category               | string     | null: false                    |
| condition              | string     | null: false                    |
| shipping_fee_condition | string     | null: false                    |
| item_address           | string     | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

belongs_to :user
has_one :order
has_one :address
has_one_attached :image

## addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | integer    | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| house_number | string     | null: false                    |
| building     | string     |                                |
| phone_number | integer    | null: false                    |

### Association

belongs_to :user
belongs_to :item
belongs_to :order

## ordersテーブル

| item         | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item
has_one :address
