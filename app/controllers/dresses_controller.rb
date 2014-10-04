class DressesController < ApplicationController
  before_action :bridal, :evening, :set_banners

  def set_banners
    @banners = Banner.dress
  end

  def bridal
    @dresses = Dress.where(category_id: 1).all
  end

  def evening
    @dresses = Dress.where(category_id: 2).all
  end

  def show
    @dress = Dress.friendly.find(params[:id])
    dresses = Dress.order(:created_at)
    current_index = dresses.index(@dress)
    @prev_dress = current_index-1 >= 0 ? dresses[current_index-1] : nil
    @next_dress = current_index+1 <= dresses.length ? dresses[current_index+1] : nil
  end
end
