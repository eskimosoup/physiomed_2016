class SubcategoriesController < ApplicationController
  before_action :find_subcategory, only: :show

  def index
    @subcategories = Subcategory.displayed
  end

  def show
    return redirect_to @subcategory, status: :moved_permanently if request.path != subcategory_path(@subcategory)
  end

  private

  def find_subcategory
    @subcategory = Subcategory.friendly.find(params[:id])
  end
end
