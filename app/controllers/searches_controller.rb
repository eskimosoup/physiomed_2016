class SearchesController < ApplicationController
  def new
    @facade = SearchFacade.new(params[:query]) if params[:query]
  end
end
