class RecipeFoodsController < ApplicationController
  before_action :set_recipe_food, only: %i[show edit update destroy]

  def index
    @recipe_foods = RecipeFood.all
  end


  def new
    @all_foods = Food.all
    @recipe_food = RecipeFood.new
  end


  def edit
    @all_foods = Food.all
  end


  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    recipe_id = params[:recipe_id]
    @recipe_food.recipe_id = recipe_id

    respond_to do |format|
      if @recipe_food.save
        format.html { redirect_to recipe_url(recipe_id), notice: 'Recipe food was successfully created.' }
      else
        format.html do
          rendirect_to new_recipe_recipe_food_url(recipe_id), status: :unprocessable_entity,
                                                              alert: 'Incomplete form submitted'
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @recipe_food.update(recipe_food_params)
        format.html { redirect_to recipe_url(@recipe_food.recipe_id), notice: 'Recipe food was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe_food.destroy

    respond_to do |format|
      format.html { redirect_to recipe_url, notice: 'Recipe food was successfully destroyed.' }
    end
  end

  private

  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
  end


  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
