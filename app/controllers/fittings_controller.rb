class FittingsController < ApplicationController

  def new
  end

  def create
    args = fitting_params
    ids = args.delete('ids')
    fitting = Fitting.new(args)
    fitting.dresses = Dress.find(ids) if ids.present?
    if fitting.save!
      FittingMailer.new_fitting_mail(fitting).deliver
      render json: {path: confirmation_fittings_path({time: params[:try_time], date: params[:try_date]})}
    else
      render json: {status: 0}
    end
  end

  def disabled_times
    date = params[:date].to_date
    times = Fitting.where(try_date: date).pluck(:try_time).map{ |t| t.to_s(:time) }
    render json: { disabled_times: times }
  end

  def selected_dresses
    @dresses = Dress.find(params['dresses'].split(','))
  end

  private

  def fitting_params
    params.permit(:name, :phone, :try_date, :try_time, ids: [])
  end

end
