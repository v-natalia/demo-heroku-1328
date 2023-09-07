class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_restaurant, only: [:show, :edit, :update]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @reviews = @restaurant.reviews
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user

    if @restaurant.save
      redirect_to restaurants_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurants_path
    else
      render :edit
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.includes(:user, :reviews).find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :category, :photo, :address, :zipcode, :city, :phone_number, :opens_at, :closes_at)
  end
end
