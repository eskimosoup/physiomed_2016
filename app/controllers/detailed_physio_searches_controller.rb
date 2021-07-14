class DetailedPhysioSearchesController < ApplicationController
  def new
    @disable_notice_modal = true
  end

  def create
    redirect_to(detailed_physio_searches_path(physio_search: query))
  end

  def show
    @disable_notice_modal = true
    @search = PhysioSearch.new(query)
    @location = PhysioSearch.new(query).location
    @results = PhysioSearch.new(query).results
  end

  private

  def query
    params.require(:physio_search).permit(:post_code)
  end
end
