class BridesController < ApplicationController

  def index
    @brides = Bride.approved.paginate(:page => params[:page], :per_page => 6)
  end

  def create
    bride = Bride.new(bride_params)
    if bride.save!
      render json: {status: 1}, status: 200
    else
      render json: {status: 0}
    end
  end

  private

  def bride_params
    params.require(:bride).permit(:name, :dress_name, :comment, :picture)
  end

end
