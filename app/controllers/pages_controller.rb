class PagesController < ApplicationController
  before_action :set_page

  def show
    return redirect_to @page, status: :moved_permanently if request.path != page_path(@page)
    if @page.what_we_do_link
      @what_we_dos = WhatWeDo.eager_load(:displayed_links)
        .displayed.order(position: :asc).merge(WhatWeDoLink.order(position: :asc))
    end
    render layout: @page.layout
  end

  private

  def set_page
    @page = Page.displayed.friendly.find(params[:id])
  end
end
