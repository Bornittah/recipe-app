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

  def public_toggle_update
    @recipe = Recipe.find(params[:recipe_id])
    if @recipe.update_column(:public, public_toggle_params[:public_toggle] == 'true')
      render json: { status: 'successful' }
    else
      render json: { status: 'not successful' }
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time, :public)
  end

  def public_toggle_params
    params.permit(:recipe_id, :public_toggle, :authenticity_token)
  end
end
