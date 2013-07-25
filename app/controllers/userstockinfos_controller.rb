class UserstockinfosController < ApplicationController
  def create
    @user_stock = Userstockinfo.new(params[:userstockinfo])
    @user_stock.user = current_user
    @user_stock.save
    redirect_to stocks_path 
  end
end
