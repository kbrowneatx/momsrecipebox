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
		@recipe = @user.recipes.new
		3.times { @recipe.ingredients.build }
		@counter = 1
  end

  def create
    @recipe = @user.recipes.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render :edit
    end 
  end

  def edit
		@counter = 1
  end

  def update
		if @recipe.update_attributes(recipe_params)
			redirect_to @recipe
		else
			render :edit
		end
	end

  def destroy
		if @recipe.destroy
			respond_to do |format|
				format.js {}
			end
		else
			flash[:error] = "Error deleting recipe. Try again or contact sysadmin"
			redirect_to @recipe
		end
  end
	
  def find_recipe
    @recipe = Recipe.find(params[:id])
  end
	
	private
	
	def recipe_params
		params.require(:recipe).permit( :id, 
																		:name,
																		:image,
																		:category_id, 
																		:cook_time, 
																		:oven_temp, 
																		:from_kitchen, 
																		:calories, 
																		:instructions, 
																		:notes, 
																		:quickneasy, 
																		:kidfav, 
																		:leftovers, 
																		:xmas, 
																		:grill, 
																		:turkey, 
																		:lite, 
																		:summer, 
																		:user_id, 
																		ingredients_attributes: [:id, :name]
																		)
	end

end
