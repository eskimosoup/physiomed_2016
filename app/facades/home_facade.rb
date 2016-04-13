class HomeFacade

  def banners
    @banners ||= Banner.displayed.ordered_by_position
  end

end
