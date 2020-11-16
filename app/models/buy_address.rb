class BuyAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_num, :prefecture_id, :city, :house_num, :building, :phone

  with_options presence: true do
    validates :city, format:        { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :house_num, format:   { with: /\A[ぁ-んァ-ン一-龥０-９]/, message: "is invalid. Input full-width characters."}
    validates :post_num, format:    { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone, numericality: { with: /\A[0-9]{10,11}\z/}
    validates :prefecture_id, numericality: { other_than: 1 }
  end

  

  def save
    # ユーザーの情報を保存し、「user」という変数に入れている
    buy = Buy.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    Address.create(post_num: post_num, prefecture_id: prefecture_id, city: city, house_num: house_num, building: building, phone: phone, buy_id: buy.id)
  end
end