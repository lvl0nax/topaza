class WelcomeController < ApplicationController

  def home
    @banners = Banner.home
  end
end
