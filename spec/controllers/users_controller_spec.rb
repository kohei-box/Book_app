require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    let(:user) {create(:user)}
    
  describe "#index" do
    context "ログインユーザーとして" do
    
      it "200レスポンスを返す。" do
        sign_in user
        get :index
        expect(response).to have_http_status "200"
      end
      
      it "正常にレスポンスを返す" do
        sign_in user
        get :index
        expect(response).to be_success
      end
      
      it "ユーザー名が表示される" do
        # sign_in user
        # get :show, params
        # expect(response.body).to include 'kohei'
      end
      
    end
    
    context "ゲストとして" do
      
      it "302レスポンスを返す" do
        get :index
        expect(response).to have_http_status "302"
      end
      
      it "ログイン画面にリダイレクト" do
        get :index
        expect(response).to redirect_to "/users/sign_in"
      end
    
    end
    
  end
  
  describe "#show" do
    
    context "ログインユーザーとして" do
      
      it "リクエストが成功すること" do
      end
      
      # it "ユーザー名が表示される" do
      #   sign_in user
      #   get users_url
      #   expect(response.body).to include 'kohei'
      # end
      
      
    end
  end

end
