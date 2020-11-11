class Item < ApplicationRecord
  with_options presence: true do
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :prefecture_id
    validates :day_id
    validates :price
  end

  validates :name, presence: true, length: {maximum: 6 }
  validates :explanation, presence: true, length: {maximum: 100 }
  
  belongs_to :user
  has_one :buy
end
