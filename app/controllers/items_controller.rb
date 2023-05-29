class ItemsController < ApplicationController
  # before_action :move_to_new, except: [:new]

  def index
    @items = Item.all
    end
  end

  def new
    @items = Item.new
  end

  def move_to_new
    unless user_signed_in?
      redirect_to new_item
    else
      redirect_to user_session_path
    end
  end
