class TransactionsController < ApplicationController
  before_action :set_item, only: [:new, :create]
  def index
    @transactions = policy_scope(Transaction)
  end

  def show
    @transaction = Transaction.find(params[:id])
    authorize @transaction
  end

  def new
    @transaction = Transaction.new
    authorize @transaction
  end

  def create
    @transaction = Transaction.new(transaction_params)
    start_date = @transaction.start_date.to_date
    end_date = @transaction.end_date.to_date
    @transaction.cost = [1, ((end_date - start_date).to_i)].max * @item.price
    @transaction.item = @item
    @transaction.user = current_user
    authorize @transaction
    if @transaction.save
      @item.available = false
      @item.save
      redirect_to item_transaction_path(@item, @transaction)
    else
      render :new
    end
  end

  def confirmation
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
    authorize @item
  end

  def transaction_params
    params.require(:transaction).permit(:start_date, :end_date, :item_id)
  end
end
