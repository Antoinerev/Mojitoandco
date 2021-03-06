class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :update, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def show

  end

  def new
    @cocktail = Cocktail.new()
    # @dose = Dose.new(cocktail_id: @cocktail.id)
  end

  def create
    @cocktail = Cocktail.new(params_cocktail)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail.id)
    else
      render :new
    end
  end

  def update
    params_cocktail[:photo] = params_cocktail[:photo_cache] if params_cocktail[:photo].nil?
    @cocktail.update(name: @cocktail.name, photo: params_cocktail[:photo])
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def params_cocktail
    params.require(:cocktail).permit(:name, :photo, :photo_cache)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
