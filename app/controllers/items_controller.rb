class ItemsController < ApplicationController
  # before_action :move_to_new, except: [:new]

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def move_to_new
    if user_signed_in?
      redirect_to user_session_path
    else
      redirect_to new_item
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :charge_id, :area_id, :shippingday_id, :price,
                                 :image)
  end
end
