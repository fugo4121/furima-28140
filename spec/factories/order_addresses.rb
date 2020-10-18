FactoryBot.define do
  factory :order_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '000-0000' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { Gimei.city.kanji }
    house_number { Gimei.town.kanji }
    building_name { 'テスト' }
    phone_number { Faker::Number.between(from: 0, to: 99_999_999_999) }
  end
end
