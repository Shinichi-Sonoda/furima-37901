require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end

  describe '配送先情報登録' do
    context '登録できる場合' do
      it '情報が適切に入力されていれば登録できる' do
        expect(@address).to be_valid
      end
      it 'buildingが空でも登録できる' do
        @address.building = ''
        expect(@address).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'postal_codeが空だと登録できない' do
        @address.postal_code = ''
        binding.pry
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeに-がないと登録できない' do
        @address.postal_code = '123456'
        @address.valid?
        expect(@address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idが選択されていないと登録できない' do
        @address.prefecture_id = '1'
        @address.valid?
        expect(@address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと登録できない' do
        @address.city = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと登録できない' do
        @address.house_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空と登録できない' do
        @address.phone_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone-numberに-を入れると登録できない' do
        @address.phone_number = '080-1234-5678'
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberに全角文字を入れると登録できない' do
        @address.phone_number = '電話番号'
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは９桁以下では登録できない' do
        @address.phone_number = '012345678'
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは12桁以下では登録できない' do
        @address.phone_number = '012345678901'
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'orderが紐づいてなければ登録できない' do
        @address.order = nil
        @address.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
