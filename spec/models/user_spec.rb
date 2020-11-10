require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、password、password_confirmation、first_name、last_name、first_name_kana、last_name_kana、birthdayが存在すれば登録できること" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
      end
      it "passwordは半角英数混合で登録できる" do
      end
      it "first_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる" do
      end
      it "last_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる" do
      end
      it "first_name_kanaが全角（カタカナ）であれば登録できる" do
      end
      it "last_name_kanaが全角（カタカナ）であれば登録できる" do
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
      end
      it "emailは、@がないと登録できない" do
      end
      it "重複したemailが存在する場合登録できない" do
      end
      it "passwordが空だと登録できない" do
      end
      it "passwordは半角英語のみだと登録できない" do
      end
      it "passwordが5文字以下であれば登録できない" do
      end
      it "passwordとpassword_confirmationが不一致では登録できない" do
      end
      it "first_nameが空だと登録できない" do
      end
      it "first_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      end
      it "last_nameが空だと登録できない" do
      end
      it "last_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      end
      it "first_name_kanaが空だと登録できない" do
      end
      it "first_name_kanaが全角（カタカナ）でなければ登録できない" do
      end
      it "last_name_kanaが空だと登録できない" do
      end
      it "last_name_kanaが全角（カタカナ）でなければ登録できない" do
      end
      it "birthdayが空だと登録できない" do
      end
    end
  end
end
