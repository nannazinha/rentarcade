class ReviewsController < ApplicationController
  before_action :set_item, only: [:new, :create]

  def index
    @reviews = policy_scope(Review)
  end

  def show
    @review = Review.find(params[:item_id])
    authorize @review
  end

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.item = @item
    @review.user = current_user
    authorize @review
    if @review.save
      redirect_to item_path(@item)
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
    authorize @item
  end

  def review_params
    params.require(:review).permit(:content, :rating, :item_id)
  end
end
