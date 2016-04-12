module Features
  def click_href_destroy(href)
    all(:href, href).each do |link|
      link.click if link["data-method"] == "delete"
    end
  end
end
