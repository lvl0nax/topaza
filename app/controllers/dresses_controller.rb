class DressesController < ApplicationController
  def index
    @dresses = Dress.all
  end

  def show
    @dress = Dress.friendly.find(params[:id])
  end
end
