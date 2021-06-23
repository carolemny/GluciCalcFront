class MealsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_meal, only: [:show, :update, :destroy]

  def index
    @meals = Meal.where(user_id: current_user.id)
    render json: @meals
  end

  def show
    render json: @meal
  end

  def show_by_date
    date = DateTime.parse(params[:iso_date]).to_date
    meals = Meal.where(date: date.all_day, user_id: current_user.id)
    render json: meals
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.user = current_user
    @meal.date = DateTime.now
    if @meal.save
      render json: @meal, status: :created, location: @meal
    else
      render json: @meal.errors, status: :unprocessable_entity
    end
  end

  def update
    if @meal.update(meal_params)
      render json: @meal
    else
      render json: @meal.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @meal.destroy
  end

  private

  def set_meal
    @meal = Meal.find_by(id: params[:id], user_id: current_user.id)
    render :json => { :error => "Unauthorized" }.to_json, :status => 401 if @meal.nil?
  end

  def meal_params
    params.fetch(:meal, {}).permit(:name, :user_id)
  end
end
