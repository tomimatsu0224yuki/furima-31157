class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    unless user_signed_in?
      # flash.now[:alert] = 'メッセージを入力してください。'
      redirect_to new_user_session_path, notice: 'You need to sign in or sign up before continuing.'
    end
  end

  private

  def item_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
end
