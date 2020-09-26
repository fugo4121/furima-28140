FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    # 英数字混合のため、直接入力
    password { 'a1a1a1' }
    password_confirmation { password }
    # カリキュラムでは、first_name＝苗字、last_name＝名前となっている
    first_name { Gimei.last.kanji }
    last_name { Gimei.first.kanji }
    first_name_kana { Gimei.last.katakana }
    last_name_kana { Gimei.first.katakana }
    birthday { Faker::Time.between_dates(from: Date.today - 20_000, to: Date.today, period: :all) }
  end
end
