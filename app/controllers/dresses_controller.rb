class DressesController < ApplicationController
  def bridal
    @dresses = Dress.all
  end
  def evening
    @dresses = Dress.all
  end

  def show
    @dress = Dress.friendly.find(params[:id])
  end
end
