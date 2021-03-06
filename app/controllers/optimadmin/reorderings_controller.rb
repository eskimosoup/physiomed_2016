module Optimadmin
  class ReorderingsController < Optimadmin::ApplicationController
    def index
      @model = params[:model].constantize
      model = @model

      @pagination_helper = model.where("#{params[:parent_model_field]} = ?", params[:parent_model_id]).field_search(params[:search])

      @model_items = Optimadmin::BaseCollectionPresenter.new(
        collection: @pagination_helper,
        view_template: view_context,
        presenter: "Optimadmin::#{params[:model].tr('::', '')}Presenter".constantize)
    end
  end
end
