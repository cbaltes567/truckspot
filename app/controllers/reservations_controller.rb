class ReservationsController < ApplicationController
  before_action :current_user_must_be_reservation_user,
                only: %i[edit update destroy]

  before_action :set_reservation, only: %i[show edit update destroy]

  def index
    @q = Reservation.ransack(params[:q])
    @reservations = @q.result(distinct: true).includes(:user,
                                                       :garage).page(params[:page]).per(10)
  end

  def show; end

  def new
    @reservation = Reservation.new
  end

  def edit; end

  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      message = "Reservation was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @reservation, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @reservation.update(reservation_params)
      redirect_to @reservation, notice: "Reservation was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @reservation.destroy
    message = "Reservation was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to reservations_url, notice: message
    end
  end

  private

  def current_user_must_be_reservation_user
    set_reservation
    unless current_user == @reservation.user
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:user_id, :garage_id, :start_date,
                                        :end_time)
  end
end
