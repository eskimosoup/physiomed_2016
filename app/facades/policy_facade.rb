class PolicyFacade
  def intiailize
  end

  def policies
    @policies ||= Policies::Document.includes(:category).displayed
  end

  def categories
    @categories ||= Policies::Category.displayed
  end
end
