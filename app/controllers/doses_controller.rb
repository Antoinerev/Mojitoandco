class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create]

  def new
    @dose = Dose.new()
  end

  def create
    # @ingredient =
    @dose = Dose.new(
      description: params_dose[:description],
      ingredient_id: params_dose[:ingredient_id],
      cocktail_id: @cocktail.id,
      )
    if @dose.save
      redirect_to cocktail_path(@cocktail.id)
    else
      render :new
    end

  end

  def detroy
  end

  private

  def params_dose
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

end
