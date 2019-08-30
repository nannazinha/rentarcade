class TransactionsController < ApplicationController
  before_action :set_item, only: [:new, :create]
  def index
    @transactions = policy_scope(Transaction).includes(:item).where(user: current_user).order(:created_at)
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
    @transaction.devoluted = false
    authorize @transaction
    if @transaction.save
      @item.available = false
      @item.save
      redirect_to item_transaction_path(@item, @transaction)
    else
      render :new
    end
  end

  def new_budget
    @transaction = Transaction.find(params[:id])
    @item = @transaction.item
    @item.available = true
    @item.save
    @transaction.destroy
    redirect_to new_item_transaction_path(@item)
  end

  def confirmed
    @transaction = Transaction.find(params[:id])
  end


  def confirmation
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
    authorize @item
  end

  def transaction_params
    params.require(:transaction).permit(:start_date, :end_date, :item_id, :devoluted)
  end
end
