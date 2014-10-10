class HistoriesController < ApplicationController
  def index
    @histories = History.order(:id).all
  end
end
