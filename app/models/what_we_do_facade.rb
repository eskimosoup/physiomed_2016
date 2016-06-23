class WhatWeDoFacade
  def what_we_dos
    @what_we_dos ||= WhatWeDo.eager_load(:displayed_links)
      .displayed.order(position: :asc)
  end
end
