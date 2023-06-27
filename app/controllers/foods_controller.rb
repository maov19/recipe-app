class FoodsController < ApplicationController
  before_action :set_food, only: %i[show destroy]

  def index
    @foods = Food.all
  end

  def show; end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.build(food_params)

    if @food.save
      redirect_to foods_url, notice: 'Food was successfully created.'
    else
      puts @food.errors.full_messages
      render :new, notice: 'Food not created.'
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_url, notice: 'Food was successfully deleted.'
  end

  private

  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :user_id)
  end
end
