module Policies
  class CategoryFacade
    attr_reader :category

    delegate :title, to: :category, prefix: true

    def initialize(category)
      @category = category
    end

    def policies
      @policies ||= category.documents.displayed
    end

    def categories
      @categories ||= Policies::Category.displayed
    end
  end
end
