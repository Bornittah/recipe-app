class RecipesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, except: %i[public show]

  def index
    # @recipes = current_user.recipes.order(created_at: :desc)
    @recipes = Recipe.all.where(user_id: current_user.id).includes(:recipe_foods)
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
    @recipe_foods = RecipeFood.all.where(recipe_id: params[:id]).includes(:food)
    @shopping_list =
      @recipe = Recipe.find(params[:id])
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = 'Recipe successfully deleted'
    redirect_to recipes_path
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
