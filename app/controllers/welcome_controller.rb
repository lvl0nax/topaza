class WelcomeController < ApplicationController

  def home
    @banners = Banner.home
    dresses_group_count = Dress.unscoped.group(:category_id).count
    @dresses_bridal_count = dresses_group_count[1]
    @dresses_evening_count = dresses_group_count[2]
  end
end
