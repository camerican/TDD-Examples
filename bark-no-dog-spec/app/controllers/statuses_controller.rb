class StatusesController < ApplicationController
  before_action :set_status, only: [:show, :edit, :update, :destroy]

  def index
    @dog = current_dog
    @statuses = Status.all
  end

  def show
  end

  def new
    @status = Status.new
    @status.dog_id = params[:dog_id]
  end

  def edit
  end

  def create
    @status = Status.new(status_params)
    @status.dog_id = params[:dog_id]
    if @status.save
      redirect_to @status.dog, notice: 'Status was successfully created.'
    else
      render :new
    end
  end

  def update
    if @status.update(status_params)
      redirect_to [@status.dog, @status], notice: 'Status was successfully updated.'
    else
      render :edit 
    end
  end

  def destroy
    @status.destroy
    redirect_to dog_statuses_url(@status.dog), notice: 'Status was successfully destroyed.'
  end

  private
  
  def set_status
    @status = Status.find(params[:id])
  end

  def status_params
    params.require(:status).permit(:body, :dog_id)
  end
end
