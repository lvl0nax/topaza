class FittingsController < ApplicationController

  def new

  end

  def create
    fitting = Fitting.new(fitting_params)
    if fitting.save!
      render json: {status: 1}, status: 200
    else
      render json: {status: 0}
    end
  end

  private

  def fitting_params
    params.require(:fitting).permit(:name, :dress_name, :comment, :picture)
  end

end
