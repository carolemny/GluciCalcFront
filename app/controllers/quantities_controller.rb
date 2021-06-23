class QuantitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_quantity, only: [:show, :update, :destroy]

  # GET /quantities
  def index
    @quantities = Quantity.all

    render json: @quantities
  end

  # GET /quantities/1
  def show
    render json: @quantity
  end

  # POST /quantities
  def create
    @quantity = Quantity.new(quantity_params)

    if @quantity.save
      render json: @quantity, status: :created, location: @quantity
    else
      render json: @quantity.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /quantities/1
  def update
    if @quantity.update(quantity_params)
      render json: @quantity
    else
      render json: @quantity.errors, status: :unprocessable_entity
    end
  end

  # DELETE /quantities/1
  def destroy
    @quantity.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quantity
      @quantity = Quantity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quantity_params
      params.fetch(:quantity, {}).permit(:quantity, :carbs_per_100g, :meal_id, :product_id, :recipe_id)
    end
end
