class OrderAddress
  include ActiveModel::Model
  # orderコントローラーから引き継ぐ全てのカラム

  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number
  

  def save
    # 購入の情報を保存
    order = Order.create(item_id: item_id, user_id: user_id)
    # 住所の情報を保存
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
  
end