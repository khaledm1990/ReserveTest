class ListItemsController < ApplicationController
  before_action :set_list_item, only: [:show]
  def show
  end

  private 

  def set_list_item
    @list_item = ListItem.find(params[:id])
  end 
end
