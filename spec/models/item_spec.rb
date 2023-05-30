require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品機能テスト' do
    context '出品できる場合' do
      it 'image､name､explanation､category_id､condition_id､charge_id､area_id､shippingday_id､priceが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '出品できない場合' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      # 商品名
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      # 商品の説明
      it 'explanationが空では出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      # 商品カテゴリ
      it 'category_idが空では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      # 商品の状態
      it 'condition_idが空では出品できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      # 配送料の負担
      it 'charge_ideが空では出品できない' do
        @item.charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end
      # 発送元の地域
      it 'area_idが空では出品できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      # 発送までの日数
      it 'shippingday_idが空では出品できない' do
        @item.shippingday_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shippingday can't be blank")
      end
      # 価格が空ではだめ
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      # 価格は半角数字0-9のみ
      it 'priceは全角では出品できない' do
        @item.price = '０１２３４５６７８９'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      # 価格は300未満では出品できない
      it 'priceが300未満では出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      # 価格は9999999以上では出品できない
      it 'priceが9999999以上では出品できない' do
        @item.price = '99999999'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end
