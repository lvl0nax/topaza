class PublicationsController < ApplicationController
  def index

  end

  def show
    @publication = Publication.friendly.find(params[:id])
  end
end
