class ListsController < ApplicationController

  def show
    @list = List.find(params[:id])
    @item = Item.new
  end
end