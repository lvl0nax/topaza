class DiscountsController < ApplicationController
  def index
    @discounts = Discount.all
    @banners = Banner.discount
  end
end