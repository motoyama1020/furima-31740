class Item < ApplicationRecord
  validates :name, presence: true, length: {maximum: 40 }
  validates :explanation, presence: true, length: {maximum: 1000 }

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :prefecture_id
    validates :day_id
  end

  validates :price, presence: true, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  belongs_to :user
  has_one :buy
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :burden
  belongs_to :category
  belongs_to :day
  belongs_to :prefecture
  belongs_to :status
end
