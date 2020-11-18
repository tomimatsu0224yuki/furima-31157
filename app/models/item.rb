class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :image, presence: true
  validates :item_name, presence: true, length: { maximum: 40 }
  validates :item_discription, presence: true, length: { maximum: 1000 }
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :condition_id, presence: true, numericality: { other_than: 1 }
  validates :shipping_charge_id, presence: true, numericality: { other_than: 1 }
  validates :prefecture_id, presence: true, numericality: { other_than: 0 }
  validates :processing_time_id, presence: true, numericality: { other_than: 1 }
  validates :price, presence: true, format: { with: /\d+/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  has_one_attached :image
  belongs_to :user
  has_one :purchases
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :processing_time

  def was_attached?
    image.attached?
  end
end
