class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'は半角英数字混合にしてください' }
  validates :nickname, presence: true
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）を入力してください' }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）を入力してください' }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ン]+\z/, message: 'は全角（カタカナ）を入力してください' }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ン]+\z/, message: 'は全角（カタカナ）を入力してください' }
  validates :birthday, presence: true
end
