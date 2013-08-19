class RecipesController < ApplicationController
	before_action :find_recipe, only: [:show, :edit, :update, :destroy]
  before_action :set_current_user, except: [:index, :show]
  respond_to :html, :js
	
  def index
		@recipes = Recipe.all
  end

  def show
  end

  def new
		@recipe = Recipe.new
		3.times { @recipe.ingredients.build }
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render :edit
    end 
  end

  def edit
  end

  def update
		if @recipe.update_attributes(recipe_params)
			redirect_to @recipe
		else
			render :edit
		end
	end

  def destroy
  end
	
  def find_recipe
    @recipe = Recipe.find(params[:id])
  end
	
	private
	
	def recipe_params
		params.require(:recipe).permit( :id, :name, :category_id, :cook_time, :oven_temp, :calories, :instructions, :notes, :email, ingredients_attributes: [:id, :name])
	end

end
