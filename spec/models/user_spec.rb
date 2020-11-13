require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname,email,password,password_confirmation,last_name,first_name,last_name_kana,first_name_kana,birth_dateが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "emailに＠が含まれた状態で登録できる" do
        @user.email = "aaa@gmial.com"
        expect(@user).to be_valid
      end
      it "passwordが6文字以上,password_confirmationと同値,半角英数字混合であれば登録できる" do
        @user.password = "hoge22"
        @user.password_confirmation = "hoge22"
        expect(@user).to be_valid
      end
      it "last_nameは全角で登録できる" do
        @user.last_name = "あああ"
        expect(@user).to be_valid
      end
      it "first_nameは全角で登録できる" do
        @user.first_name = "いいい"
        expect(@user).to be_valid
      end
      it "last_name_kanaは全角（カタカナ）で登録できる" do
        @user.last_name_kana = "アアア"
        expect(@user).to be_valid
      end
      it "first_name_kanaは全角（カタカナ）で登録できる" do
        @user.first_name_kana = "イイイ"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailに＠が含まれないと登録できない" do
        @user.email = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "重複したemailが存在する場合は登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "password_confirmationとpasswordが同値でなければ登録できない" do
        @user.password = "hoge12"
        @user.password_confirmation = "fuga34"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが5文字以下だと登録できない" do
        @user.password = "hoge1"
        @user.password_confirmation = "hoge1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordは半角英数字混合でなければ登録ができない" do
        @user.password = "111111"
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_nameは全角でなければ登録できない" do
        @user.last_name = "hoge"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameは全角でなければ登録できない" do
        @user.first_name = "fuga"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "last_name_kanaが空だと登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "last_name_kanaは全角（カタカナ）でなければ登録できない" do
        @user.last_name_kana = "あああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "first_name_kanaは全角（カタカナ）でなければ登録できない" do
        @user.first_name_kana = "いいい"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it "birth_dateが空では登録できない" do
        @user.birth_date = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end

