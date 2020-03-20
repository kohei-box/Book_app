require 'rails_helper'

RSpec.describe User, type: :model do
  
  it "名前、メール、パスワードが有効か" do
      user = User.create(
        name: 'kohei',
        email: 'tester@example.com',
        password: 'doremifasorasido',
        )
      expect(user).to be_valid
  end
    
  context "空欄ついてのバリデーション" do
    
    it "nameが空行で無効" do
      user = User.create(
        name: ' ',
        email: 'tester@example.com',
        password: 'doremifasorasido',
        )
      user.valid?
      expect(user.errors[:name]).to include("が入力されていません。")
    end 
    
    it "emailが空行で無効" do
      user = User.create(
        name: 'kohei',
        email: ' ',
        password: 'doremifasorasido',
        )
      user.valid?
      expect(user.errors[:email]).to include("が入力されていません。")
    end
    
    it "passwordが空行で無効" do
      user = User.create(
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
   user = User.new(email: "koehi:gmail.com")
   user.valid?
   expect(user.errors[:email]).to include("は有効でありません。")
  end
  
  it "メールが重複して無効" do
    user = User.create(
      name: 'kohei',
      email: 'tester@example.com',
      password: 'doremifasorasido',
    )
      
    other_user = User.new(
      name: 'yamahana',
      email: 'tester@example.com',
      password: 'doremifasorasido',
    )
    
    other_user.valid?
    expect(user.errors[:email]).to_not include("は既に使用されています。")
  end
  
  it "パスワードが不一致だった場合" do
    user = User.new( password: "123456",
                     password_confirmation: "654321")
    user.valid?
    expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
  end
      
      
end 
  


