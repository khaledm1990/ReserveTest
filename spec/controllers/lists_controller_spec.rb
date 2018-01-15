require 'rails_helper'

RSpec.describe ListsController, type: :controller do
  describe "GET index" do
    it "assigns @lists" do
      list = List.create
      get :index
      expect(assigns(:lists)).to eq([list])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

end
