class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    # @ingredient = Ingredient.find(params[:dose][:ingredient_id])
    @dose = Dose.new(strong_params)
    # @dose.ingredient = @ingredient
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    # raise
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    dose = Dose.find(params[:id])
    dose.destroy
    redirect_to cocktail_path(dose.cocktail)
  end

  private

  def strong_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
