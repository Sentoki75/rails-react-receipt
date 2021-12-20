class Api::V1::RecipesController < ApplicationController
  def index
    recipe = Recipe.all.order(created_at: :desc)
    render json: recipe
  end

  def create
    recipe = Recipe.new(recipe_params)
    if recipe.save
      render json: recipe
    else
      render json: { errors: recipe.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    if recipe
      render json: recipe
    else
      render json: { message: 'Recipe not found' }, status: :not_found
    end
  end

  def destroy
    recipe&.destroy
    render json: { message: 'Recipe deleted' }
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :image, :ingredients, :instructions)
  end

  def recipe
    @recipe ||= Recipe.find_by(id: params[:id])
  end
end
