require 'rails_helper'

RSpec.describe Tagging, type: :model do
  let(:tagging) {create :tagging}
  let(:soft_deleted_tagging) {create :soft_deleted_tagging}
  describe "columns" do 
    it "should has colimn list_item_id as integer" do 
      expect(tagging).to have_db_column(:list_item_id)
    end 
    it "should has colimn tag_id as integer " do 
      expect(tagging).to have_db_column(:tag_id)
    end
  end 
  describe "associations" do 
    it "should belong_to list_item" do 
      expect(tagging).to belong_to(:list_item)
    end
    it "should belong_to tag" do 
      expect(tagging).to belong_to(:tag)
    end
  end 

  describe "soft_destroy" do 
    let(:time) {Time.now}
    before { Timecop.freeze(time) }
    it "should change deleted_at " do
      expect{ tagging.soft_destroy }.to change{ tagging.deleted_at }.from(nil).to(time)
    end 

  end 

  describe "restore" do 
    it "should change deleted_at to nil" do 
      expect{ soft_deleted_tagging.restore }.to change{ soft_deleted_tagging.deleted_at }.to(nil)
    end 
  end
end
