require 'rails_helper'

RSpec.describe ListsController, type: :controller do
  let(:list) {create :list}
  let(:soft_deleted_list) {create :soft_deleted_list}
  let(:invalid_list) {create :invalid_list}

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

    it "renders the thrash template" do
      get :thrash
      expect(response).to render_template :thrash
    end
  end

  describe "GET new" do 
    it "render the new templete" do 
      get :new
      expect(response).to render_template :new
    end 
  end 

  describe "POST create" do 
    context "with valid attributes" do 
      it " should save the new list" do 
        expect{ post :create, params: {list: FactoryGirl.attributes_for(:list)} }.to  change(List,:count).by(1)
      end 
      it " should redirect to root path" do 
        post :create, params: {list: FactoryGirl.attributes_for(:list) }
        expect(response).to redirect_to(root_path)
      end 
    end 

    context "with invalid attributes" do 
      it " should not save a the new list" do 
        expect{ post :create, params: {list: FactoryGirl.attributes_for(:invalid_list)} }.not_to  change(List,:count)        
      end 

      it "should render the new templete"  do  
        post :create, params: {list: FactoryGirl.attributes_for(:invalid_list)}
        expect(response).to render_template :new
      end 
    end
  end 

  describe "GET edit" do 
    let(:list_att){FactoryGirl.attributes_for(:list)} 
    it "render the new templete" do 
      get :edit,params: {id: list.id, list: list_att}
      expect(response).to render_template :edit
    end 
    it "should locate the requested list " do 
      get :edit ,params: {id: list.id}
      expect(assigns(:list)).to eq(list)
    end
  end 


  describe "PUT update " do  
    let(:second_list) {create :second_list}
    context "with valid attributes" do
      it "should locate the requested list " do 
        put :update,params: {id: list.id, list: FactoryGirl.attributes_for(:list)}
        expect(assigns(:list)).to eq(list)
      end

      it "should change the list attributes" do 
        put :update,params: {id: list.id, list: FactoryGirl.attributes_for(:second_list)}
        list.reload
        expect(list.name).to eq(second_list.name)
      end 
      it "should redirect to root path" do 
        put :update,params: {id: list.id, list: FactoryGirl.attributes_for(:second_list)}
        expect(response).to redirect_to(root_path)
      end 
    end 
    context "with invalid attributes" do
      it "should render edit templete" do 
        put :update,params: {id: list.id, list: FactoryGirl.attributes_for(:invalid_list)}
        expect(response).to render_template :edit
      end 
    end 
  end 

  describe "PUT soft_destroy" do 

    it "should locate the requested list " do 
      get :edit ,params: {id: list.id}
      expect(assigns(:list)).to eq(list)
    end
    
    it "should soft delete the list " do 
      put :soft_destroy, params: {id: list.id}
      list.reload
      expect(list.deleted_at).not_to eq(nil)
    end

    it "should redirect to root path " do 
      put :soft_destroy, params: {id: list.id}
      expect(response).to redirect_to(root_path)
    end
  end 

  describe "PUT restore" do 

    it "should locate the requested list " do 
      get :edit ,params: {id: list.id}
      expect(assigns(:list)).to eq(list)
    end

    it "should restore the list " do 
      put :restore, params: {id: list.id}
      list.reload
      expect(list.deleted_at).to eq(nil)
    end

    it "should redirect to thrush_path " do 
      put :restore, params: {id: list.id}
      expect(response).to redirect_to(thrash_lists_path)
    end
  end

  describe "DELETE destroy" do 
    let!(:list) {create :list}

    it "should locate the requested list " do 
      get :edit ,params: {id: list.id}
      expect(assigns(:list)).to eq(list)
    end

    it "should delete the list " do 
      expect{ put :destroy, params: {id: list.id} }.to change(List, :count).by(-1)
    end


    it "should redirect to thrush path " do 
      delete :destroy, params: {id: list.id}
      expect(response).to redirect_to(root_path)
    end
  end
end
