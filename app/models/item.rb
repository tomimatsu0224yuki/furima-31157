class Item < ApplicationRecord
 belongs_to :users
 has_one :purchases
 belongs_to :category(active_hash)
 belongs_to :condition(active_hash)
 belongs_to :shipping_charge(active_hash)
 belongs_to :prefecture(active_hash)
 belongs_to :processing_time(active_hash)
 belongs_to :price(active_hash)
 has_one_attached :image
end
