class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(params.require(:item).permit(:name, :completed))
    if @item.save
      redirect_to @items, notice: "Item was saved successfully."
    else
      flash[:error] = "Error creating item. Please try again."
      render :new
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

end
