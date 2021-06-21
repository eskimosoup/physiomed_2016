class DetailedPhysioSearchesController < ApplicationController
  def new
  end

  def create
    redirect_to(detailed_physio_searches_path(physio_search: query))
  end

  def show
    @search = PhysioSearch.new(query)
    @location = PhysioSearch.new(query).location
    @results = PhysioSearch.new(query).results
  end

  private

  def query
    params.require(:physio_search).permit(:post_code)
  end
end
