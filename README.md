# テーブル設計

## ユーザー(user) テーブル

| Column             | Type        | Options                         |
| ------             | ----------  | ------------------------------- |
| nickname           | string      | null: false                     |
| email              | string      | null: false                     |
| password           | string      | null: false                     |
| first_name         | string      | null: false                     |
| family_name        | string      | null: false                     |
| first_name_kana    | string      | null: false                     |
| family_name_kana   | string      | null: false                     |
| birthday           | date        | null: false                     |

### Association

- has_many :items
- has_many :purchases

## 商品(item) テーブル

| Column             | Type        | Options                         |
| ------             | ----------  | ------------------------------- |
| name               | string      | null: false                     |
| explain            | text        | null: false                     |
| category           | integer     | null: false                     |
| condition          | integer     | null: false                     |
| sending_cost       | integer     | null: false                     |
| sending_prefecture | integer     | null: false                     |
| sending_days       | integer     | null: false                     |
| price              | string      | null: false                     |
| user               | references  | null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :purchase

## 住所(address) テーブル

| Column             | Type        | Options                         |
| ------             | ----------  | ------------------------------- |
| postal_code        | string      | null: false                     |
| prefecture         | integer     | null: false                     |
| city               | string      | null: false                     |
| house_number       | string      | null: false                     |
| building_name      | string      |                                 |
| phone_number       | string      | null: false                     |

### Association

- has_many :purchases

## 購入(purchase) テーブル

| Column             | Type        | Options                         |
| ------             | ----------  | ------------------------------- |
| user               | references  | null: false, foreign_key: true  |
| item               | references  | null: false, foreign_key: true  |
| purchase           | references  | null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address