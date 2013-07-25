class UserstockinfosController < ApplicationController
  def create
    @user_stock = Userstockinfo.new(params[:userstockinfo])
    @user_stock.stock = @stock
    @user_stock.user = current_user
    @user_stock.save
    binding.pry
    redirect_to stocks_path 
  end
end
