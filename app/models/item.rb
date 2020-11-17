class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
   validates :item_name, presence: true, length: {maximum: 40} 
   validates :item_discription, presence: true, length: {maximum: 1000}
   validates :price, presence: true, format: { with: /\d+/ }, numericality: {greater_than_or_equal_to: 300}, numericality: {less_than_or_equal_to: 9999999}

  #avtive hash 
   belongs_to :category
   belongs_to :condition
   belongs_to :shipping_charge
   belongs_to :prefecture
   belongs_to :processing_time

   validates :category_id, presence: true,numericality: { other_than: 1 } 
   validates :condition_id,presence: true, numericality: { other_than: 1 } 
   validates :shipping_charge_id, presence: true,numericality: { other_than: 1 } 
   validates :prefecture_id, presence: true,numericality: { other_than: 0 } 
   validates :processing_time_id, presence: true,numericality: { other_than: 1 } 
  #/ative hash
 
  #acrive strage
  has_one_attached :image
  #/active strage

  
  belongs_to :user
  has_one :purchases
  
   
  def was_attached?
    self.image.attached?
  end
end
