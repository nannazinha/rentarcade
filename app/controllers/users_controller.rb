class UsersController < ApplicationController
  def my_account
    if params[:user_id] == current_user
      @items = Item.all
    end
  end
end
