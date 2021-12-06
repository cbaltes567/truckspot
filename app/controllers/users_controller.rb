class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@users.where.not(location_latitude: nil)) do |user, marker|
      marker.lat user.location_latitude
      marker.lng user.location_longitude
    end
  end

  def show
    @favorite = Favorite.new
    @review = Review.new
    @reservation = Reservation.new
  end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)

    if @user.save
      message = "User was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @user, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "User was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    message = "User was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to users_url, notice: message
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:license_plate_number, :vehicle_id,
                                 :location)
  end
end
