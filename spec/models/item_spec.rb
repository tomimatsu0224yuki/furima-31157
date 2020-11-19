require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品がうまくいくとき' do
      it 'user, image, item_name, item_discripion, category_id, condition_id, shipping_charge_id, prefecture_id, processing_time_id, priceが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it 'userが存在しないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it 'imageが存在しないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが存在しないと出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_discriptionが存在しないと出品できない' do
        @item.item_discription = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item discription can't be blank")
      end
      it 'category_idの情報が存在しないと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'condition_idの情報が存在しないと出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end
      it 'shipping_charge_idの情報が存在しないと出品できない' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping charge must be other than 1')
      end
      it 'prefecture_idの情報が存在しないと出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 0')
      end
      it 'processing_time_idの情報が存在しないと出品できない' do
        @item.processing_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Processing time must be other than 1')
      end
      it 'priceが存在しないと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが¥300以下だと出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが¥9,999,999以上だと出品できない' do
        @item.price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'priceが半角数字以外だと出品できない' do
        @item.price = 'hoge'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
