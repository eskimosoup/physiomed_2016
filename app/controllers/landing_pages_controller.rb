class LandingPagesController < ApplicationController
  def show
    @facade = LandingPageFacade.new(find_landing_page)
    render @facade.style, layout: @facade.layout
  end

  private

  def find_landing_page
    LandingPage.displayed.friendly.find(params[:id])
  end
end
