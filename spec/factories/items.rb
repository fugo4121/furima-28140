FactoryBot.define do
  factory :item do
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/star.png'), filename: 'star.png')
    end

    name { 'テスト' }
    explain { 'テストです' }
    category_id { Faker::Number.between(from: 2, to: 11) }
    condition_id { Faker::Number.between(from: 2, to: 7) }
    sending_cost_id { Faker::Number.between(from: 2, to: 3) }
    sending_prefecture_id { Faker::Number.between(from: 2, to: 10) }
    sending_day_id { Faker::Number.between(from: 2, to: 48) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
  end
end
