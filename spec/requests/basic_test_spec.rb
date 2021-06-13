require 'rails_helper'

describe "POST /api/v1/create_article" do
  context "with valid parameters" do
    let(:new_user) do
      {
        email: "checkthat@gmail.com",
        password: "1234567"
      }
    end
    let(:new_article) do
      {
          title: "How to bake cakes",
          description: "blablabla",
          user_id: 1
      }
    end

    let(:current_user) {User.last}

    it "creates new user" do
      expect { post "/api/v1/users", params: new_user }.to change(User, :count).by(+1)
    end

    it "generates token" do
      post "/api/v1/users", params: new_user
      post "/api/v1/auth", params: new_user
      expect(JSON.parse(response.body)["token"].length).to eq(100)
    end

    # it "creates a new article" do
    #   post "/api/v1/users", params: new_user
    #   post "/api/v1/auth", params: new_user
    #   allow(Api::V1::ArticleController).to receive(:current_user).User.last)
    #   expect { post "/api/v1/create_article", params: new_article,headers: { 'Authorization' => JSON.parse(response.body)["token"]} }.to change(Article, :count).by(+1)
    #   expect(response).to have_http_status :created
    # end
  end
end
