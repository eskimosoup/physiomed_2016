module Optimadmin
  class LandingPages::GuidesController < Optimadmin::ApplicationController
    before_action :set_landing_page

    def index
      @guides = @landing_page.landing_pages_guides
    end

    private

    def set_landing_page
      @landing_page = LandingPage.friendly.find(params[:landing_page_id])
    end
  end
end
