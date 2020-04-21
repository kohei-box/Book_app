require 'rails_helper'

RSpec.describe User, type: :model do
  
  it "factoryが有効か" do
    expect(build(:user)).to be_valid
  end
  
  it "名前、メール、パスワードが有効である" do
      user = User.new(
        name: 'kohei',
        email: 'test@example.com',
        password: 'doremifasorasido',
        )
      expect(user).to be_valid
  end
    
  context "空欄ついてのバリデーション" do
    
    it "nameが空行で無効" do
      user = User.new(
        name: ' ',
        email: 'tester@example.com',
        password: 'doremifasorasido',
        )
      user.valid?
      expect(user.errors[:name]).to include("が入力されていません。")
    end 
    
    it "emailが空行で無効" do
      user = User.new(
        name: 'kohei',
        email: ' ',
        password: 'doremifasorasido',
        )
      user.valid?
      expect(user.errors[:email]).to include("が入力されていません。")
    end
    
    it "passwordが空行で無効" do
      user = User.new(
        name: 'kohei',
        email: 'tester@example.com',
        password: ' ',
        )
      user.valid?
      expect(user.errors[:password]).to include("が入力されていません。")
    end
  end
  
  
  it "名前が20文字を超えた場合" do
   user =  User.new(name: "#{"1" * 21}")
   user.valid?
   expect(user.errors[:name]).to include("は20文字以下に設定して下さい。")
  end
     
  it "メールのフォーマットが違う場合" do
   invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                     foo@bar_baz.com foo@bar+baz.com]
   invalid_addresses.each do |email|
     user = User.new(email: "#{email}")
     user.valid?
     expect(user.errors[:email]).to include("は有効でありません。")
   end
  end
  
  it "メールが重複して無効" do
    user = User.create(
      name: 'kohei',
      email: 'tester@example.com',
      password: 'doremifasorasido',
      password_confirmation: 'doremifasorasido'
    )
      
    other_user = User.new(
      name: 'yamahana',
      email: 'tester@example.com',
      password: 'doremifasorasido',
      password_confirmation: 'doremifasorasido'
    )
    
    other_user.valid?
    expect(user.errors[:email]).to include("は既に使用されています。")
  end
  
  it "パスワードが不一致だった場合" do
    user = User.new( name: 'yamahana',
                     email: 'tester@example.com',
                     password: "123456",
                     password_confirmation: "654321")
    user.valid?
    expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
  end
  
  describe "メソッドの検証" do 
    
    it "ユーザーのフォローができる" do
    end

    
    it "ユーザーのフォローを外せる" do
    end
    
    it "フォロー相手の記事を取得できる" do
    end
  end
      
end 
  


