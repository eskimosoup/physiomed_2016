class WhatWeDoFacade
  def what_we_dos
    @what_we_dos ||= WhatWeDo.joins(:links).displayed.order(position: :asc)
      .merge(WhatWeDoLink.displayed).preload(:links)
  end
end
