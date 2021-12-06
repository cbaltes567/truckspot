class FavoritesController < ApplicationController
  before_action :set_favorite, only: %i[show edit update destroy]

  def index
    @q = Favorite.ransack(params[:q])
    @favorites = @q.result(distinct: true).includes(:user,
                                                    :garage).page(params[:page]).per(10)
  end

  def show; end

  def new
    @favorite = Favorite.new
  end

  def edit; end

  def create
    @favorite = Favorite.new(favorite_params)

    if @favorite.save
      message = "Favorite was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @favorite, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @favorite.update(favorite_params)
      redirect_to @favorite, notice: "Favorite was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @favorite.destroy
    message = "Favorite was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to favorites_url, notice: message
    end
  end

  private

  def set_favorite
    @favorite = Favorite.find(params[:id])
  end

  def favorite_params
    params.require(:favorite).permit(:user_id, :garage_id)
  end
end
