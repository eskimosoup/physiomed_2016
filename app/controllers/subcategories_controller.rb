class SubcategoriesController < ApplicationController
  before_action :find_subcategory, only: :show

  def index
    @subcategories = Subcategory.displayed
  end

  def show
  end

  private

  def find_subcategory
    @subcategory = Subcategory.friendly.find(params[:id])
  end
end
