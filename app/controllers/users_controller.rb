class UsersController < ApplicationController
  before_action :authenticate_user!, :set_user

  def profile

  end

  def panel
    @my_items = @user.items
    @boooked_items = @user.items.where(available: false)
  end

  private

  def set_user
    @user = current_user
    authorize @user
  end
end
