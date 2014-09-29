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
  end
end
