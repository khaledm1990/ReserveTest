require 'rails_helper'

RSpec.describe ListsController, type: :controller do
  let(:list) {create :list}
  let(:soft_deleted_list) {create :soft_deleted_list}

  describe "GET index" do
    it "assigns @lists" do
      get :index
      expect(assigns(:lists)).to eq([list])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET thrash" do
    it "assigns @lists" do
      get :thrash
      expect(assigns(:lists)).to eq([soft_deleted_list])
    end

    it "renders the index template" do
      get :thrash
      expect(response).to render_template :thrash
    end
  end

end
