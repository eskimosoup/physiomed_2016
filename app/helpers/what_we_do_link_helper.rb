module WhatWeDoLinkHelper
  def link_class(link: what_we_do_link, current: current_what_we_do_link)
    if link == current
      'current'
    else
      'not-current'
    end
  end
end
