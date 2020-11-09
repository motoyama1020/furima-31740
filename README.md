# README

## User

|Column           |Type    |Options                    |
| --------------- | ------ | ------------------------- |
| nickname        | string | null: false               |
| first_name      | string | null: false               |
| last_name       | string | null: false               |
| first_name_kana | string | null: false               |
| last_name_kana  | string | null: false               |
| birthday        | date   | null: false               |
| email           | string | null: false, unique: true |
| password        | string | null: false, unique: true |

### Association
has_many :items
has_many :buy


## Items

|Column       |Type        |Options                         |
| ----------- | ---------- | ------------------------------ |
| product     | string     | null: false                    |
| explanation | text       | null: false                    |
| category    | string     | null: false                    |
| status      | string     | null: false                    |
| burden      | string     | null: false                    |
| prefectures | date       | null: false                    |
| days        | string     | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :buy


## Buy

|Column   |Type        |Options                         |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| buy_day | datetime   | null: false                    |
| items   | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :items
has_many :address


## Address

|Column       |Type        |Options                         |
|------------ | -----------| ------------------------------ |
| post_num    | string     | null: false                    |
| prefectures | string     | null: false                    |
| city        | string     | null: false                    |
| building    | string     | null: false                    |
| house_num   | string     | null: false                    |
| phone       | date       | null: false                    |
| buy         | references | null: false, foreign_key: true |

### Association
belongs_to :buy
