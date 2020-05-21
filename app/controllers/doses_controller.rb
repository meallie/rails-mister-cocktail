class DosesController < ApplicationController
  def new
    @dose = Dose.new(dose_params)
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @dose
    if @dose.save
      redirect_to new_cocktail_dose_path(@dose)
    else
      render :new
    end
  end

  def destroy
    @dose.destroy
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
