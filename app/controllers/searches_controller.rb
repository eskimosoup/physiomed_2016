class SearchesController < ApplicationController
  def new
    redirect_to root_url(anchor: 'home-find-a-physio-search') unless params[:query]

    @facade = SearchFacade.new(params[:query])
  end
end
