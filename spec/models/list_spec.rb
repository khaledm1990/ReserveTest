require 'rails_helper'

RSpec.describe List, type: :model do
  let(:list) {create :list}

  describe "columns" do 
    it "should has colimn name as string" do 
      expect have_db_column(:name)
    end 
    it "should has colimn deleted_at as datetime " do 
      expect have_db_column(:deleted_at)
    end
  end 

  describe "validation" do 
    it "require name" do 
      is_expected.to validate_presence_of(:name)
    end 
  end 

  describe "associations" do 
    it "should has_many list_items" do 
      expect(list).to have_many(:list_items)
    end 
  end 

  describe "callback" do 
    it "call soft_destroy_list_items after soft_destroy" do 
      expect(list).to callback(:soft_destroy_list_items).after(:soft_destroy)
    end 
    it "call restore_list_items after restore" do 
      expect(list).to callback(:restore_list_items).after(:restore)
    end
  end 

  describe "scopes" do 
    let!(:list) {create :list}
    let!(:soft_deleted_list) {create :soft_deleted_list}
    it " active return all lists where deleted_at is nil" do 
      expect(List.active.first).to eq(list)
    end 
    it " soft_destroyed return all lists where deleted_at is NOT nil" do 
      expect(List.soft_destroyed.first).to eq(soft_deleted_list)
    end 
  end 
end
