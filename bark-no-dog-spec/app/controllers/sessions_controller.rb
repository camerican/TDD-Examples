class SessionsController < ApplicationController

  def new
  end

  def create
    @dog = Dog.find_by_email(params[:email])
    if @dog && @dog.authenticate(params[:password])
      session[:dog_id] = @dog.id
      flash[:notice] = "Walked in the doggy door successfully."
    else
      flash[:alert] = "There was a problem, you're in the doghouse."
    end
    redirect_to root_path
  end

  def destroy
    session[:dog_id] = nil
    flash[:notice] = "You've been taken for a walk successfully and signed out."
    redirect_to root_path
  end

end