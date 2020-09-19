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
- belongs_to :address
- belongs_to :purchase

## 商品(item) テーブル

| Column             | Type        | Options                         |
| ------             | ----------  | ------------------------------- |
| image              | text        | null: false                     |
| name               | string      | null: false                     |
| explain            | text        | null: false                     |
| category           | string      | null: false                     |
| condition          | string      | null: false                     |
| sending_cost       | string      | null: false                     |
| sending_prefecture | string      | null: false                     |
| sending_days       | integer     | null: false                     |
| price              | string      | null: false                     |
| user               | references  | null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :purchase

## 住所(address) テーブル

| Column             | Type        | Options                         |
| ------             | ----------  | ------------------------------- |
| postal_code        | integer     | null: false                     |
| prefecture         | string      | null: false                     |
| city               | string      | null: false                     |
| house_number       | string      | null: false                     |
| building_name      | string      | null: false                     |
| phone_number       | integer     | null: false                     |
| user               | references  | null: false, foreign_key: true  |

### Association

- belongs_to :user

## 購入(purchase) テーブル

| Column             | Type        | Options                         |
| ------             | ----------  | ------------------------------- |
| user               | references  | null: false, foreign_key: true  |
| item               | references  | null: false, foreign_key: true  |

### Association

- has_many :users
- belongs_to :item