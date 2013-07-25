class UserSessionsController < ApplicationController
  skip_before_filter :require_login, :except => [:destroy]

  def new
    @user = User.new
    respond_to do |format|
      format.html
      format.js { render layout: false }
    end
  end

  def create
    respond_to do |format|
      if @user = login(params[:username], params[:password])
        format.html { redirect_back_or_to(:users, :notice => 'Login successful.') }
        format.xml { render :xml => @user, :status => :created, :location => @user }
        format.js { 
          @logged_in = true
          render layout: false
        }
      else
        format.html { flash.now[:alert] = "Login failed."; render :action => "new" }
        format.xml { render :xml => @user.errors, :status => :unprocessable_entity }
        format.js { 
          @logged_in = false
          render layout: false 
        }
      end
    end
  end

  def destroy
    logout
    respond_to do |format|
      format.html { 
        redirect_to(:users, :notice => 'Logged out!')
      }
      format.js{
        render layout: false;
      }

    end
  end
end
