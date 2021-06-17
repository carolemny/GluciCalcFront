class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :update, :destroy]

  # GET /foods
  def index
    @foods = Food.all

    render json: @foods
  end

  # GET /foods/1
  def show
    render json: @food
  end

  def show_by_api_id
    food = Food.where(api_product_id: params[:api_id])
    render json: food
  end

  # POST /foods
  def create
    if food_already_exists?
      @food = Food.new(food_params)

      if @food.save
        render json: @food, status: :created, location: @food
      else
        render json: @food.errors, status: :unprocessable_entity
      end
    else
      render json: {message: "This product is already registered"}
    end
  end

  # PATCH/PUT /foods/1
  def update
    if @food.update(food_params)
      render json: @food
    else
      render json: @food.errors, status: :unprocessable_entity
    end
  end

  # DELETE /foods/1
  def destroy
    @food.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = Food.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def food_params
      params.fetch(:food, {}).permit(:name, :api_product_id, :category, :description, :duration)
    end

    def food_already_exists?
      !Food.where(api_product_id: params[:api_product_id]).exists?
    end
end
