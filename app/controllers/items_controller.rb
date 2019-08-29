class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :return]

  def index
    if params[:category] == "console"
      @items = Item.where(category: "Console").page(params[:page]).per(12)
    elsif params[:category] == "jogo"
      @items = Item.where(category: "Jogo").page(params[:page]).per(12)
    else
      @items = Item.all.page(params[:page]).per(12)
    end
    @items = @items.where(available: true)
    policy_scope(@items)
  end

  def show
  end

  def new
    @item = Item.new
    @item.category = params[:category]
    # if params[:category] == "Console"
    #   @item.game_title = ""
    # end
    authorize @item
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    authorize @item
    if @item.save
      redirect_to item_path(@item)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @item.update(item_params)
    redirect_to item_path(@item)
  end

  def destroy
    @item.destroy
    redirect_to items_path
  end

  def return
    @item.available = true
    @item.save
    redirect_to items_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
    authorize @item
  end

  def item_params
    params.require(:item).permit(:console_model, :game_title, :category, :price, :user_id, :photo)
  end
end
