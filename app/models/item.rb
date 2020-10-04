class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :explain
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  with_options numericality: { other_than: 1, message: 'を選択してください' } do
    validates :category_id
    validates :condition_id
    validates :sending_cost_id
    validates :sending_prefecture_id
    validates :sending_day_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :sending_cost
  belongs_to_active_hash :sending_prefecture
  belongs_to_active_hash :sending_day
end
