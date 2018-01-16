require 'rails_helper'

RSpec.describe ListItemsController, type: :controller do
  let(:list_item) {create :list_item}
  describe "PUT soft_destroy" do 

    it "should locate the requested list_item " do 
      put :soft_destroy ,params: {id: list_item.id}
      expect(assigns(:list_item)).to eq(list_item)
    end
    
    it "should soft delete the list_item " do 
      put :soft_destroy, params: {id: list_item.id}
      list_item.reload
      expect(list_item.deleted_at).not_to eq(nil)
    end

    it "should redirect to root path " do 
      put :soft_destroy, params: {id: list_item.id}
      expect(response).to redirect_to(root_path)
    end
  end 

  describe "GET show" do 
    it "should locate the requested list_item " do 
      get :show ,params: {id: list_item.id}
      expect(assigns(:list_item)).to eq(list_item)
    end
    it "renders the show template" do
      get :show,params: {id: list_item.id}
      expect(response).to render_template :show
    end
  end 
end
