class PhysioSearchesController < ApplicationController
  def create
    redirect_to physio_search_path(physio_search: query)
  end

  def show
    @search = PhysioSearch.new(query)
  end

  private

  def query
    params.require(:physio_search).permit(:post_code)
  end
end
