module Services
  class CategoriesController < ApplicationController
    def index
      @facade = Services::CategoryFacade.new
    end

    def show
      category = Category.friendly.displayed.find(params[:id])
      return redirect_to service_category_path(category), status: :moved_permanently if request.path != service_category_path(category)
      @facade = Services::CategoryFacade.new(category)
    end
  end
end
