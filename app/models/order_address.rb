class OrderAddress
  include ActiveModel::Model
  
  # orderコントローラーから引き継ぐ全てのカラム
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number
  
  VALID_PASSWORD_REGEX1 = /\A\d{3}[-]\d{4}\z/.freeze
  VALID_PASSWORD_REGEX2 = /\A[0-9]{1,11}\z/.freeze

  with_options presence: true do
    validates :city
    validates :house_number
  end

  validates :phone_number, format: { with: VALID_PASSWORD_REGEX2, message: "は11桁以内のハイフンなしで入力してください"}
  validates :postal_code, format: {with: VALID_PASSWORD_REGEX1, message: "はxxx-xxxx(ハイフンあり)で入力してください"}

  with_options numericality: { other_than: 1, message: 'を選択してください' } do
    validates :prefecture_id
  end


  def save
    # 購入の情報を保存
    order = Order.create(item_id: item_id, user_id: user_id)
    # 住所の情報を保存
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
  
end