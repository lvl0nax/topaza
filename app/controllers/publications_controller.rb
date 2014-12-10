class PublicationsController < ApplicationController
  def index
    @publications = Publication.order(id: :desc).paginate(:page => params[:page], :per_page => 6)
  end

  def show
    @publication = Publication.friendly.find(params[:id])
    publications = Publication.order(id: :desc)
    current_index = publications.index(@publication)
    @prev_publication = current_index-1 >= 0 ? publications[current_index-1] : nil
    @next_publication = current_index+1 <= publications.length ? publications[current_index+1] : nil
  end
end
