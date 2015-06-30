class PinsController < ApplicationController
  before_action :find_pin_by_id, only: [:show, :edit, :update, :destroy]

  def index
    @pins = Pin.all.order("created_at DESC")
  end

  def show
  end

  def new
    @pin = Pin.new
  end

  def create
    @pin = Pin.new(pin_params)
    if @pin.save
      redirect_to @pin
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @pin = Pin.update(pin_params)
    if @pin.save
      redirect_to @pin
    else
      render 'edit'
    end
  end

  def destroy
    @pin.delete
    redirect_to root_path
  end

  private

    def find_pin_by_id
      @pin = Pin.find(params[:id])      
    end

    def pin_params
      params.require(:pin).permit(:title, :description)
    end
end
