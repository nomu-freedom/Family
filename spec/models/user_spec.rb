require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザーの新規登録" do
    context "新規登録がうまくいくとき" do
      it "全ての入力欄が埋まっているとき" do
        expect(@user).to be_valid
      end
    end

    context "新規登録がうまくいかない時" do
      it "ニックネームが空のとき" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname 空になっています。入力してください。")
      end
      it "メアドが空の時" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレス 空になっています。入力してください。")
      end
      it "＠がメアドに含まれていない時" do
        @user.email = "asd123"
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレス translation missing: ja.activerecord.errors.models.user.attributes.email.invalid")
      end
      it "重複したメアドが存在する場合" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("メールアドレス translation missing: ja.activerecord.errors.models.user.attributes.email.taken")
      end
      it "パスワードが空の時" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード 空になっています。入力してください。")
      end
      it "パスワードが5文字以下の時" do
        @user.password = "aaaaa"
        @user.password_confirmation = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード translation missing: ja.activerecord.errors.models.user.attributes.password.too_short")
      end
      it "確認用のパスワードが空の時" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("確認用パスワード translation missing: ja.activerecord.errors.models.user.attributes.password_confirmation.confirmation")
      end
      it "パスワードと確認用のパスワードが違う時" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "bbbbbb"
        @user.valid?
        expect(@user.errors.full_messages).to include("確認用パスワード translation missing: ja.activerecord.errors.models.user.attributes.password_confirmation.confirmation")
      end
    end
    
  end
end
