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

  def get_data
    data  = params[:ticker].split(",");
    #if data.length >= 2
    #  binding.pry
    #end
    respond_to do |format|
      format.html {}
      format.js {}
      format.json { render json: Ystock.find(data) }
    end
  end
end
