class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  VALID_PASSWORD_REGEX1 = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  VALID_PASSWORD_REGEX2 = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  VALID_PASSWORD_REGEX3 = /\A[ァ-ン]+\z/.freeze
  with_options presence: true do
    validates :password, format: { with: VALID_PASSWORD_REGEX1, message: 'は半角英数字混合にしてください' }
    validates :nickname
    validates :first_name, format: { with: VALID_PASSWORD_REGEX2, message: 'は全角（漢字・ひらがな・カタカナ）を入力してください' }
    validates :last_name, format: { with: VALID_PASSWORD_REGEX2, message: 'は全角（漢字・ひらがな・カタカナ）を入力してください' }
    validates :first_name_kana, format: { with: VALID_PASSWORD_REGEX3, message: 'は全角（カタカナ）を入力してください' }
    validates :last_name_kana, format: { with: VALID_PASSWORD_REGEX3, message: 'は全角（カタカナ）を入力してください' }
    validates :birthday
  end
end
