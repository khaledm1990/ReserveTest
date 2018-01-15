class ListItemsController < ApplicationController
  before_action :set_list_item, only: [:show, :soft_destroy]

  def show
  end

  
  def soft_destroy
    @list_item.soft_destroy
    redirect_to root_path
  end

  private 

  def set_list_item
    @list_item = ListItem.find(params[:id])
  end 
end
