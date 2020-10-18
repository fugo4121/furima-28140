require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe 'テーブル登録' do
    before do
      @user = FactoryBot.build(:user)
      @order_address = FactoryBot.build(:order_address)
      @order_address.user_id = @user.id
    end

    context 'テーブル登録がうまくいく時' do
      it '購入と住所テーブルの全てのカラムが存在していれば保存ができること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end

      it '建物名が空でも保存ができること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context 'テーブル登録がうまくいかない時' do
      it 'tokenが空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('クレジットカード情報を正しく入力してください')
      end

      it '郵便番号が空だと保存できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('郵便番号はxxx-xxxx(ハイフンあり)で入力してください')
      end

      it '郵便番号がハイフンを4桁目に入力しないと保存できないこと1' do
        @order_address.postal_code = '0000-000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('郵便番号はxxx-xxxx(ハイフンあり)で入力してください')
      end
      it '郵便番号がハイフンありで入力しないと保存できないこと' do
        @order_address.postal_code = '0000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('郵便番号はxxx-xxxx(ハイフンあり)で入力してください')
      end

      it '郵便番号が数値でで入力しないと保存できないこと' do
        @order_address.postal_code = 'AAA-AAAA'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('郵便番号はxxx-xxxx(ハイフンあり)で入力してください')
      end

      it '都道府県が未選択だと保存できないこと' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('都道府県を選択してください')
      end

      it '市区町村が空だと保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('市区町村を入力してください')
      end

      it '番地が空だと保存できないこと' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('番地を入力してください')
      end

      it '電話番号が空だと保存できないこと' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は11桁以内のハイフンなしで入力してください')
      end

      it '電話番号が11桁以内でないと保存できないこと' do
        @order_address.phone_number = '000000000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は11桁以内のハイフンなしで入力してください')
      end

      it '電話番号がハイフンなしでないと保存できないこと' do
        @order_address.phone_number = '00-0000-000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は11桁以内のハイフンなしで入力してください')
      end
      
    end
  end
end
