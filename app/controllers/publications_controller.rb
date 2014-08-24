class PublicationsController < ApplicationController
  def index
    @publications = Publication.all

  end

  def show
    @publication = Publication.friendly.find(params[:id])
  end
end
