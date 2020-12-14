require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "全ての項目を入力すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "tanaka123"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "user_nameが空だと登録できない" do
        @user.user_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("User name can't be blank")
      end
      it "パスワードが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "重複したユーザー名が存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.user_name = @user.user_name
        another_user.valid?
        expect(another_user.errors.full_messages).to include("User name has already been taken")
      end
      it "名前が空では登録できない" do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it "重複した名前が存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.name = @user.name
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Name has already been taken")
      end
      it "passwordが5文字以下であれば登録できない" do
          @user.password = 'aaa12'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordとpassword_confirmationが一致しなければ登録できない" do
        @user.password_confirmation = "aaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "役職が空では登録できない" do
        @user.position_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Position can't be blank")
      end
      it "役職が--では登録できない" do
        @user.position_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("Position must be other than 1")
      end
    end
  end
end
end