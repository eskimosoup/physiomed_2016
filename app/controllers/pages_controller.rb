class PagesController < ApplicationController

  def show
    page = find_page
    return redirect_to page, status: :moved_permanently if request.path != page_path(page)
    @page_facade = PageFacade.new(page)
    render layout: @page_facade.layout
  end

  private

  def find_page
    Page.displayed.friendly.find(params[:id])
  end
end
