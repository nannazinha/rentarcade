class DevolutionsController < ApplicationController
  before_action :set_item, only: [:new, :create]
  before_action :set_transaction, only: [:new, :create]

  def new
  end

  def create
    @item.available = true
    @item.save
    @transaction.devoluted = true
    @transaction.save
    redirect_to transactions_path
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
    authorize @item
  end

  def set_transaction
    @transaction = Transaction.find(params[:format])
    authorize @transaction
  end
end
