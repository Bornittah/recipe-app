class RecipesController < ApplicationController
  load_and_authorize_resource

  def index
    @recipes = current_user.recipes.order(created_at: :desc)
  end

  def new
    @recipe = current_user.recipes.build
    @user = current_user
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to recipes_path, notice: 'Recipe created successfully'
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:recipe_id])
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    if @recipe.destroy
      redirect_to recipes_path, notice: 'Recipe deleted successfully'
    else
      render :index
    end
  end

  def public_recipe_list
    @recipes = Recipe.where(public: true).order(created_at: :desc)
  end

  def public_toggle
    @recipe = current_user.recipes.find(params[:recipe_id])
    @recipe&.update(public: !@recipe.public)
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time, :public)
  end
end
