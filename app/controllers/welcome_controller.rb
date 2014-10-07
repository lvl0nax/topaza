class WelcomeController < ApplicationController

  def home
    @banners = Banner.home
    @dress_bridal_count = Dress.bridal.count
    @dress_evening_count = Dress.evening.count
  end
end
