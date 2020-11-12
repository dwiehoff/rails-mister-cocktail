class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end
  def new
    @cocktail = Cocktail.new
  end
  def show
    @cocktail = Cocktail.find(params[:id])
  end
  def create
    @cocktail = Cocktail.create(strong_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def strong_params
    params.require(:cocktail).permit(:name)
  end
end
