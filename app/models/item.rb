class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  #avtive hash 
   belongs_to :category
   belongs_to :condition
   belongs_to :shipping_charge
   belongs_to :prefecture
   belongs_to :processing_time

   validates :category_id, numericality: { other_than: 1 } 
   validates :condition_id, numericality: { other_than: 1 } 
   validates :shipping_charge_id, numericality: { other_than: 1 } 
   validates :prefecture_id, numericality: { other_than: 1 } 
   validates :processing_time_id, numericality: { other_than: 1 } 
  #/ative hash
 
  #acrive strage
  has_one_attached :image
  validates :content, presence: true, unless: :was_attached?
  #/active strage

  
  belongs_to :users
  has_one :purchases
  
   
 def was_attached?
  self.image.attached?
end
end
