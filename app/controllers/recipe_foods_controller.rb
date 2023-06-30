class RecipeFoodsController < ApplicationController
  def new
    @user = current_user
    @recipe = RecipeFood.new
  end

  def create
    quantity = params[:quantity]
    food = Food.find(params[:food_id])
    recipe = Recipe.find(params[:recipe_id])

    @recipe_food = RecipeFood.new(quantity:, food_id: food.id, recipe_id: recipe.id)

    if @recipe_food.save
      redirect_to recipe_path(recipe.id), notice: 'Recipe food successfully created'
    else
      render 'new', notice: 'Something went wrong!'
    end
  end

  def edit
    @recipe_food = RecipeFood.find(params[:id])
    @foods = Food.all
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])

    if @recipe_food.update(recipe_food_params)
      redirect_to recipe_path(@recipe_food.recipe_id), notice: 'Recipe food successfully updated!'
    else
      render 'edit', notice: 'Something went wrong!'
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])

    if @recipe_food.destroy
      redirect_to recipe_path(@recipe_food.recipe_id), notice: 'Recipe food successfully deleted!'
    else
      render 'new', notice: 'Something went wrong!'
    end
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
