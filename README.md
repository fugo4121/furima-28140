# テーブル設計

## ユーザー(user) テーブル

| Column             | Type        | Options                         |
| ------             | ----------  | ------------------------------- |
| nickname           | string      | null: false                     |
| email              | string      | null: false                     |
| password           | string      | null: false                     |
| last_name          | string      | null: false                     |
| first_name         | string      | null: false                     |
| last_name_kana     | string      | null: false                     |
| first_name_kana    | string      | null: false                     |
| birthday           | date        | null: false                     |

### Association

- has_many :items
- has_many :orders

## 商品(item) テーブル

| Column                | Type        | Options                         |
| ------                | ----------  | ------------------------------- |
| name                  | string      | null: false                     |
| explain               | text        | null: false                     |
| category_id           | integer     | null: false                     |
| condition_id          | integer     | null: false                     |
| sending_cost_id       | integer     | null: false                     |
| sending_prefecture_id | integer     | null: false                     |
| sending_days_id       | integer     | null: false                     |
| price                 | integer     | null: false                     |
| user                  | references  | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :order

## 住所(address) テーブル

| Column                | Type        | Options                         |
| ------                | ----------  | ------------------------------- |
| postal_code           | string      | null: false                     |
| prefecture_id         | integer     | null: false                     |
| city                  | string      | null: false                     |
| house_number          | string      | null: false                     |
| building_name         | string      |                                 |
| phone_number          | string      | null: false                     |
| order                 | references  | null: false, foreign_key: true  |

### Association

- belongs_to :order

## 購入(order) テーブル

| Column             | Type        | Options                         |
| ------             | ----------  | ------------------------------- |
| user               | references  | null: false, foreign_key: true  |
| item               | references  | null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address