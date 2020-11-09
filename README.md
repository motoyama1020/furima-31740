# README

## User

|Column                     |Type    |Options                    |
| ------------------------- | ------ | ------------------------- |
| nickname                  | string | null: false               |
| first_name                | string | null: false               |
| last_name                 | string | null: false               |
| first_name_kana           | string | null: false               |
| last_name_kana            | string | null: false               |
| birthday                  | date   | null: false               |
| email                     | string | null: false, unique: true |
| encrypted_password        | string | null: false, unique: true |

### Association
has_many :items
has_many :buys


## Items

|Column         |Type        |Options                         |
| ------------- | ---------- | ------------------------------ |
| product       | string     | null: false                    |
| explanation   | text       | null: false                    |
| category_id   | integer    | null: false                    |
| status_id     | integer    | null: false                    |
| burden_id     | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| day_id        | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :buy


## Buy

|Column   |Type        |Options                         |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_many :addresses


## Address

|Column         |Type        |Options                         |
|-------------- | -----------| ------------------------------ |
| post_num      | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| building      | string     |                                |
| house_num     | string     | null: false                    |
| phone         | string     | null: false                    |
| buy           | references | null: false, foreign_key: true |

### Association
belongs_to :buy
