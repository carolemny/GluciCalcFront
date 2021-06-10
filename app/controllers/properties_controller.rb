class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :is_Landlord?, only: [:update, :destroy]

  # GET /properties
  def index
    @properties = Property.all

    render json: @properties
  end

  # GET /properties/1
  def show
    @user = User.find(@property.user_id)
    render json: {property: @property, user: @user}
  end

  # POST /properties
  def create
    @property = Property.new(property_params)
    @property.user = current_user
    if @property.save
      render json: @property, status: :created, location: @property
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /properties/1
  def update
    if @property.update(property_params)
      render json: @property
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  # DELETE /properties/1
  def destroy
    @property.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_params
      params.permit(:title, :description, :price, :location, :category, user_id: current_user.id)
    end

    def is_Landlord?
      if current_user.nil? || @property.user_id != current_user.id
        render json: { message: "You are not authorized to edit/delete this post." }, status: :unauthorized
      end
    end
end
