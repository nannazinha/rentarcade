class UsersController < ApplicationController
  before_action :authenticate_user!, :set_user

  def panel
    @items = @user.items
    authorize @user
  end

  private

  def set_user
    @user = current_user
  end
end