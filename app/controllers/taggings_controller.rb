class TaggingsController < ApplicationController
    before_action :set_tagging, only: [:soft_destroy, :restore]

    def soft_destroy
        @tagging.soft_destroy
        @list_item = ListItem.find(params[:list_item_id])
        redirect_to list_list_item_path(id: @list_item, list_id: @list_item.list.id)
      end 
    
      def restore
        @tagging.restore
        @list_item = ListItem.find(params[:list_item_id])
        redirect_to list_list_item_path(id: @list_item, list_id: @list_item.list.id)
      end 
    
      private 
    
        def set_tagging
          @tagging =Tagging.find_by(tag_id: params[:tag_id],list_item_id: params[:list_item_id] )
        end
    
        def tagging_params
          params.require(@tagging).permit(:tag_id,:list_item_id)
        end
end
