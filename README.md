# テーブル設計

## users

| Column          | Type   | Options                       |
| --------------- | ------ | ----------------------------- |
| nickname        | string | null: false, uniqueness: true |
| email           | string | null: false                   |
| password        | string | null: false                   |
| last_name       | string | null: false                   |
| first_name      | string | null: false                   |
| last_name_kana  | string | null: false                   |
| first_name_kana | string | null: false                   |
| birth_date      | date   | null: false                   |

### Association

- has_many :items
- has_many :purchases


## items

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item_name          | string     | null: false                    |
| item_description   | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| shipping_charge_id | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| processing_time_id | integer    | null: false                    |
| price              | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :purchase
- belongs_to :category(active_hash)
- belongs_to :condition(active_hash)
- belongs_to :shipping_charge(active_hash)
- belongs_to :prefecture(active_hash)
- belongs_to :processing_time(active_hash)
- belongs_to :price(active_hash)


## addresses

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postal_code   | string  | null: false |
| prefecture_id | integer | null: false |
| city          | string  | null: false |
| block         | string  | null: false |
| building_name | string  |             |
| phone_num     | string  | null: false |

### Association
- belongs_to :prefecture(active_hash)
- belongs_to :purchase


## purchases

| Column | Type       | Options                        |
| item   | references | null: false, foreign_key :true |
| user   | references | null: false, foreign_key :true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## category(active_hash)
| Column   | Type   | Options     |
| category | string | null: false |

### Association
- has_many :items


## condition(active_hash)
| Column    | Type   | Options     |
| condition | string | null: false |

### Association
- has_many :items


## shipping_charge(active_hash)
| Column          | Type   | Options     |
| shipping_charge | string | null: false |

### Association
- has_many :items


## prefecture(active_hash)
| Column     | Type   | Options     |
| prefecture | string | null: false |

### Association
- has_many :items


## processing_time(active_hash)
| Column          | Type   | Options     |
| processing_time | string | null: false |

### Association
- has_many :items


## price(active_hash)
| Column | Type   | Options     |
| price  | string | null: false |

### Association
- has_many :items