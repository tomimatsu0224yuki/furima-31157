class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    redirect_to new_user_session_path, notice: 'You need to sign in or sign up before continuing.' unless user_signed_in?
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_discription, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :processing_time_id, :price).merge(user_id: current_user.id)
  end
end
