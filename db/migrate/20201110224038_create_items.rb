class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      
      t.references :user, foreign_key: true
      t.string :item_name, null:false
      t.text :item_discription, null:false
      # avtive hash
      t.integer :category_id ,null: false
      t.integer :condition_id, null: false
      t.integer :shipping_charge_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :processing_time_id, null: false
      t.integer :price, null: false
      t.timestamps
      # /active hash

    end
  end
end
