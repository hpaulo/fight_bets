class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:username], params[:password])
      redirect_back_or_to(user_path(@user), :message => 'Voce esta logado.')
    else  
      flash.now[:alert] = "Login failed."
      render :action => :new
    end
  end

  def destroy
    logout
    redirect_to(:root, :message => 'Deslogado com sucesso!')
  end
end
