require 'rails_helper'

RSpec.describe TaggingsController, type: :controller do
  let(:tagging) {create :tagging}

  describe "PUT soft_destroy" do 
    it "should locate the requested tagging " do 
      put :soft_destroy ,params: {tag_id: tagging.tag,list_item_id: tagging.list_item_id }
      expect(assigns(:tagging)).to eq(tagging)
    end
    
    it "should soft delete the tagging " do 
      put :soft_destroy ,params: {tag_id: tagging.tag,list_item_id: tagging.list_item_id }
      tagging.reload
      expect(tagging.deleted_at).not_to eq(nil)
    end

    it "should redirect to root_path " do 
      put :soft_destroy ,params: {tag_id: tagging.tag,list_item_id: tagging.list_item_id }
      expect(response).to redirect_to(list_list_item_path(id: tagging.list_item, list_id: tagging.list_item.list))
    end
  end 

  describe "PUT restore" do 
    it "should locate the requested tagging " do 
      put :restore ,params: {tag_id: tagging.tag,list_item_id: tagging.list_item_id }
      expect(assigns(:tagging)).to eq(tagging)
    end
    
    it "should restore the tagging " do 
      put :restore ,params: {tag_id: tagging.tag,list_item_id: tagging.list_item_id }
      tagging.reload
      expect(tagging.deleted_at).to eq(nil)
    end

    it "should redirect to root_path " do 
      put :restore ,params: {tag_id: tagging.tag,list_item_id: tagging.list_item_id }
      expect(response).to redirect_to(list_list_item_path(id: tagging.list_item, list_id: tagging.list_item.list))
    end
  end
end
