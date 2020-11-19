class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :image
    validates :item_name, length: { maximum: 40 }
    validates :item_discription, length: { maximum: 1000 }

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :shipping_charge_id
      validates :processing_time_id
    end

    validates :prefecture_id, numericality: { other_than: 0 }
    validates :price, format: { with: /\d+/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  has_one_attached :image
  belongs_to :user
  has_one :purchases
  # avtive hash
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :processing_time
  # /avtive hash

  def was_attached?
    image.attached?
  end
end
