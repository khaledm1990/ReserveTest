require 'rails_helper'

RSpec.describe Tag, type: :model do
  let(:tag) {create :tag}

  describe "columns" do 
    it "should has colimn name as string" do 
      expect(tag).to have_db_column(:name)
    end 
  end 

  describe "validation" do 
    it "require name" do 
      expect(tag).to validate_presence_of(:name)
    end 
  end 

  describe "associations" do 
    it "should has_many taggings" do 
      expect(tag).to have_many(:taggings)
    end 
    it "should has_many list_items" do 
      expect(tag).to have_many(:list_items).through(:taggings)
    end 
  end 
end
