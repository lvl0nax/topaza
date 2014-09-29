class DressesController < ApplicationController
  before_action :bridal, :evening, :set_banners

  def set_banners
    @banners = Banner.dress
  end

  def bridal
    @dresses = Dress.all
  end

  def evening
    @dresses = Dress.all
  end

  def show
    @dress = Dress.friendly.find(params[:id])
    @dresses = Dress.paginate(:page => params[:page], :per_page => 1)
    @prev_dress = @dress == Dress.first ? nil : Dress.find(@dress.id-1)
    @next_dress = @dress == Dress.last ? nil : Dress.find(@dress.id+1)
  end
end
