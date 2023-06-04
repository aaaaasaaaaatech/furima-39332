require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '購入機能テスト' do
    context '購入できる場合' do
      it 'postcode､area_id､municipalities､address､building､phone,number-form,expiry-form,cvc-form(トークンが生成されていれば)が存在すれば購入できる' do
        expect(@order_address).to be_valid
      end

      it 'buildingが存在せずとも購入できる' do
        @order_address.building = nil
        @order_address.valid?
      end
    end

    context '購入できない場合' do
      it 'postcodeが空では購入できない' do
        @order_address.postcode = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode can't be blank")
      end

      it 'postcodeが空では購入できない' do
        @order_address.postcode = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode can't be blank")
      end

      it 'area_idが空では購入できない' do
        @order_address.area_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Area can't be blank")
      end

      it 'municipalitiesが空では購入できない' do
        @order_address.municipalities = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipalities can't be blank")
      end

      it 'addressが空では購入できない' do
        @order_address.address = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end

      it 'phoneが空では購入できない' do
        @order_address.phone = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone can't be blank")
      end

      it 'postcodeは3桁ハイフン4桁がないと購入できない' do
        @order_address.postcode = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postcode is invalid. Enter it as follows (e.g. 123-4567)')
      end

      it 'postcodは全角では購入できない' do
        @order_address.postcode = '１２３－４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postcode is invalid. Enter it as follows (e.g. 123-4567)')
      end

      it 'phoneは10桁以上11桁以内でないと購入できない' do
        @order_address.phone = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is too short')
      end

      it 'phoneは半角数でのみでないと購入できない' do
        @order_address.phone = '１２３４５６７８９０'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is too short')
      end

      it 'phoneはハイフンが入ると購入できない' do
        @order_address.phone = '090-1236-4567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is too short')
      end
    end
  end
end
