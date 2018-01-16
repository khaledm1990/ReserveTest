require 'rails_helper'

RSpec.describe ListItem, type: :model do
  let(:list_item) {create :list_item}
  let(:list_item_with_tags) {create :list_item_with_tags}

  describe "columns" do 
    it "should has colimn name as string" do 
      expect(list_item).to have_db_column(:name)
    end 
    it "should has colimn deleted_at as datetime " do 
      expect(list_item).to have_db_column(:deleted_at)
    end
  end 

  describe "validation" do 
    it "require name" do 
      expect(list_item).to validate_presence_of(:name)
    end 
  end 

  describe "associations" do 
    it "should has_many taggings" do 
      expect(list_item).to have_many(:taggings).dependent(:destroy)
    end 
    it "should has_many tags" do 
      expect(list_item).to have_many(:tags).through(:taggings)
    end
    it "should has_many current_tags" do 
      expect(list_item).to have_many(:current_tags).through(:taggings)
    end
    it "should has_many removed_tags" do 
      expect(list_item).to have_many(:removed_tags).through(:taggings)
    end
    it "should belong_to list" do 
      expect(list_item).to belong_to(:list)
    end
  end 

  describe "callback" do 
    it "call soft_destroy_taggings after soft_destroy" do 
      expect(list_item).to callback(:soft_destroy_taggings).after(:soft_destroy)
    end 
    it "call restore_taggings after restore" do 
      expect(list_item).to callback(:restore_taggings).after(:restore)
    end
  end 

  describe "scopes" do 
    let!(:list_item) {create :list_item}
    let!(:soft_deleted_list_item) {create :soft_deleted_list_item}
    it " active return all list_items where deleted_at is nil" do 
      expect(ListItem.active.first).to eq(list_item)
    end 
    it " soft_destroyed return all list_items where deleted_at is NOT nil" do 
      expect(ListItem.soft_destroyed.first).to eq(soft_deleted_list_item)
    end 
    it " soft_destroyed return all list_items where deleted_at is NOT nil" do 
      expect(ListItem.soft_destroyed.first).to eq(soft_deleted_list_item)
    end 
  end
end
