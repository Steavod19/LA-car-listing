class ManufacturersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @manufacturers = Manufacturer.all
  end

  def new
    @manufacturer = Manufacturer.new
  end
  def create
    @manufacturer = Manufacturer.new(manufacturer_params)

    if @manufacturer.save
      flash[:notice] = "You've successfully submitted a manufacturer!"
      redirect_to @manufacturer
    else
      flash[:alert] = "Fail"
      render "new"
    end
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  private

  def manufacturer_params
    params.require(:manufacturer).permit(:name, :country)
  end

end
