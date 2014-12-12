class ItemsController < ApplicationController
  respond_to :html, :js

  def index
    @items = Item.all
    @item = Item.new
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
    @item = Item.find(params[:id])
    respond_with(@item)
  end

  def create
    @items = Item.all
    @item = Item.new(params.require(:item).permit(:name, :completed))
    if @item.save
    else
      flash[:error] = "Error creating item. Please try again."
      render :new
    end

    respond_with(@item) do |format|
      format.html { redirect_to items_path }
    end

  end

  def update
   @item = Item.find(params[:id])
   if @item.update_attributes(params.require(:item).permit(:name, :completed))
     redirect_to @items
   else
     flash[:error] = "Error saving item. Please try again"
     render :edit
   end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_with(@item) do |format|
      format.html { redirect_to items_path }
    end
  end

end
