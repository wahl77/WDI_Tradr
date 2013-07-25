class StocksController < ApplicationController
  def index
    @user_stock = Userstockinfo.new
    @user_stock.build_stock
  end

  def show
    @stock = Stock.find(params[:id])
  end

  def new
    @stock = Stock.new
  end

  def create
    
  end

  def update
  end

  def delete
  end
end
