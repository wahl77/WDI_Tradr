class UserstockinfosController < ApplicationController
  def create
    @user_stock = Userstockinfo.new(params[:userstockinfo])
    
    #stock = StockQuote::Stock.quote(@user_stock.stock.ticker)
    stock = Ystock.get_stock(@user_stock.stock.ticker)
    @user_stock.user = current_user
    @user_stock.price = stock[@user_stock.stock.ticker.to_sym][:price]
    @user_stock.save
    respond_to do |format|
      format.html { redirect_to stocks_path }
      format.js { render layout: false }

    end
  end

  def refresh
    render template: "userstockinfos/create", layout: false
  end
end
