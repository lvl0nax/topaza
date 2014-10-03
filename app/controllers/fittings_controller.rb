class FittingsController < ApplicationController

  def new
  end

  def create
    args = fitting_params
    ids = args.delete('ids')
    fitting = Fitting.new(args)
    fitting.dresses = Dress.find(ids) if ids.present?
    if fitting.save!
      #render json: {path: contacts_path}
      render 'confirmation'
    else
      render json: {status: 0}
    end
  end

  def disabled_times
    date = params[:date].to_date
    times = Fitting.where(try_date: date).pluck(:try_time).map{ |t| t.to_s(:time) }
    render json: { disabled_times: times }
  end

  private

  def fitting_params
    params.permit(:name, :phone, :try_date, :try_time, ids: [])
  end

end
