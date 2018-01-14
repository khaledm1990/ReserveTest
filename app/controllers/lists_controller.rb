class ListsController < ApplicationController

  before_action :set_list, only: [:edit, :update, :destroy, :soft_destroy, :restore]

  def index
    @lists = List.active
  end

  def thrash
    @lists = List.soft_destroyed
  end 

  def new 
    @list = List.new
  end 

  def create
    @list = List.new(list_params)
      if @list.save
        redirect_to root_path
      else
        render :new 
      end
  end 

  def edit
  end

  def update
      if @list.update(list_params)
        redirect_to root_path
      else
        render :edit
      end
  end

  def soft_destroy
    @list.soft_destroy
    redirect_to root_path
  end 

  def restore
    @list.restore
    redirect_to thrash_lists_path
  end 

  def destroy
    @list.destroy
    redirect_to root_path
  end

  private 

    def set_list
      @list = List.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:id,:name)
    end
end
