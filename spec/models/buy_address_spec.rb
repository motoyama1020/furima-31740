require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  describe '購入記録' do
    before do
      @buy_address = FactoryBot.build(:buy_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@buy_address).to be_valid
    end
    it 'post_numが空だと保存できないこと' do
      @buy_address.post_num = nil
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Post num can't be blank")
    end
    it 'post_numが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @buy_address.post_num = '1234567'
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Post num is invalid. Include hyphen(-)")
    end
    it 'prefecture_idを選択していないと保存できないこと' do
      @buy_address.prefecture_id = 0
      @buy_address.valid?
      expect(@buy_address.errors.full_messages)
    end
    it 'cityが空だと保存できないこと' do
      @buy_address.city = nil
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numが空だと保存できないこと' do
      @buy_address.house_num = nil
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("House num can't be blank")
    end
    it 'phoneが空だと保存できないこと' do
      @buy_address.phone = nil
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Phone can't be blank")
    end
    it 'phoneが全角数字だと保存できないこと' do
      @buy_address.phone = '２０００'
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Phone is not a number")
    end
    it 'phoneが12桁以上だと保存できないこと' do
      @buy_address.phone = '2222222222'
      @buy_address.valid?
      expect(@buy_address.errors.full_messages)
    end
    it "tokenが空では登録できないこと" do
      @buy_address.token = nil
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end