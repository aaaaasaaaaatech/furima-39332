# テーブル設計

## users テーブル

|Column            |Type   |Options                  |
|------------------|-------|-------------------------|
|nickname          |string |null: false              |
|email             |string |null: false, unique: true|
|password          |string |null: false              |
|encrypted_password|string |null: false              |
|first_name        |string |null: false              |
|last_name         |string |null: false              |
|first_name_kana   |string |null: false              |
|last_name_kana    |string |null: false              |
|birth_year        |date   |null: false              |
|birth_month       |date   |null: false              |
|birth_day         |date   |null: false              |

### Association
- has_many :items
- has_many :buys
- has_many :delivers


## items テーブル
|Column      |Type       |Options                        |
|------------|-----------|-------------------------------|
|name        |string     |null: false                    |
|category    |string     |null: false                    |
|explanation |text       |null: false                    |
|condition   |string     |null: false                    |
|price       |string     |null: false                    |
|user        |references |null: false, foreign_key: true |



### Association
- belongs_to :user
- has_many :buys
- has_many :delivers



## buys テーブル

|Column        |Type       |Options                        |
|--------------|-----------|-------------------------------|
|postcode      |string     |null: false                    |
|prefectures   |string     |null: false                    |
|municipalities|string     |null: false                    |
|address       |string     |null: false                    |
|building      |string     |                               |
|phone         |string     |null: false                    |
|user          |references |null: false, foreign_key: true |
|item          |references |null: false, foreign_key: true |
|delivers      |references |null: false, foreign_key: true |



### Association
- belongs_to :user
- belongs_to :item
- has_one:deliver


## delivers テーブル

|Column     |Type       |Options                        |
|-----------|-----------|-------------------------------|
|area       |string     |null: false, unique: true      |
|duration   |string     |null: false                    |
|user       |references |null: false, foreign_key: true |
|item       |references |null: false, foreign_key: true |
|price      |references |null: false, foreign_key: true |
|buy        |references |null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :buy
