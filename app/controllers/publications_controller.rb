class PublicationsController < ApplicationController
  def index
    @publications = Publication.paginate(:page => params[:page], :per_page => 6)
  end

  def show
    @publication = Publication.friendly.find(params[:id])
    @prev_publication = @publication == Publication.first ? nil : Publication.find(@publication.id-1)
    @next_publication = @publication == Publication.last ? nil : Publication.find(@publication.id+1)
  end
end
