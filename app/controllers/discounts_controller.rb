class DiscountsController < ApplicationController
  def index
    @discounts = Discount.order(:id).all
    @banners = Banner.discount
  end
end
