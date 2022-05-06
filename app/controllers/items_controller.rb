class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit, :udpate, :destroy]
  before_action :search_item, only: [:show, :edit, :update, :destroy]


  def index
    @items = Item.all.order('created_at DESC')
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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :shipping_fee_condition_id, :prefecture_id,
                                 :lead_time_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    redirect_to root_path unless @item.user == current_user
  end

  def search_item
    @item = Item.find(params[:id])
  end
end
