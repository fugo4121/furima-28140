require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do

    context '商品登録がうまくいく時' do

      it '全カラムのデータが存在すれば登録できる' do
        expect(@item).to be_valid
      end

    end

    context '商品登録がうまくいかない時' do

      it '画像がないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('画像を入力してください')
      end

      it '商品名が空だと登録できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include('商品名を入力してください')
      end

      it '商品の説明が空だと登録できない' do
        @item.explain = ""
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の説明を入力してください')
      end

      it 'カテゴリーが未選択だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
      end

      it '商品の状態が未選択だと登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を選択してください')
      end

      it '配送料の負担が未選択だと登録できない' do
        @item.sending_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を選択してください')
      end

      it '発送元の地域が未選択だと登録できない' do
        @item.sending_prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を選択してください')
      end

      it '発送までの日数が未選択だと登録できない' do
        @item.sending_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を選択してください')
      end

      it '価格が空だと登録できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end

      it '価格が¥300以上でないと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は300以上の値にしてください')
      end

      it '価格が¥9999999以下でないと登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は9999999以下の値にしてください')
      end

      it '価格が全角だと登録できない' do
        @item.price = "１００"
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end

    end
  end
end
