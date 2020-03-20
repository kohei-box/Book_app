require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "ログイン済みの場合" do
    
    before do 
      @user = FactoryBot.create(:user)
    end
    
    it "正常にレスポンスを返す。" do
      sign_in @user
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "ログインしてない場合" do
    
    it "ログイン画面にリダイレクト" do
      get :index
      expect(response).to redirect_to "/users/sign_in"
    end
    
  end

end
