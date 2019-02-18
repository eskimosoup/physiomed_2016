module Policies
  class CategoriesController < ApplicationController
    def show
      category = Category.friendly.find(params[:id])
      @facade = Policies::CategoryFacade.new(category)
    end
  end
end
