class TransactionsController < ApplicationController
  before_action :set_item, only: [:new, :create]
  def index
    @transactions = Transaction.all
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    start_date = @transaction.start_date.to_date
    end_date = @transaction.end_date.to_date
    @transaction.cost = [1, ((end_date - start_date).to_i)].max * @item.price
    @transaction.item = @item
    @transaction.user = current_user
    if @transaction.save
      redirect_to transactions_path
    else
      render :new
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def transaction_params
    params.require(:transaction).permit(:start_date, :end_date)
  end
end
