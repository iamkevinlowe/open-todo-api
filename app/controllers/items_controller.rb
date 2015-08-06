class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
  end

  def create
    item = Item.new(item_params)
    item.list = List.find(params[:list_id])
    if item.save
      flash[:notice] = "\"#{item.description}\" created successfully."
      redirect_to [item.list.user, item.list]
    else
      flash[:error] = "There was an error. Please try again."
      redirect_to [item.list.user, item.list]
    end
  end

  def update
    item = Item.find(params[:id])
    if item.update_attributes(item_params)
      flash[:notice] = "\"#{item.description}\" updated successfully."
      redirect_to [item.list.user, item.list]
    else
      flash[:error] = "There was an error. Please try again."
      redirect_to [item.list.user, item.list]
    end
  end

  private

  def item_params
    params.require(:item).permit(:description, :complete)
  end
end