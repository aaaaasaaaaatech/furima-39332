class ItemsController < ApplicationController
  # before_action :move_to_new, except: [:new]
  before_action :authenticate_user!, :set_item, only: [:new, :edit, :destroy]
  def index
    @items = Item.all
    # @sold_out_items = calculate_sold_out_items(@items)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @username = @item.user.nickname
  end

  def edit
    @item = Item.find(params[:id])
    return if user_signed_in? && current_user.id == @item.user_id

    redirect_to action: :index
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
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
                                 :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  # def calculate_sold_out_items(items)
  #   items.select { |item| item.sold_out? }
  # end
end
