module Services
  class CategoryFacade
    attr_reader :category

    delegate :title, :content, :style, to: :category, prefix: true

    def initialize(category = nil)
      @category = category.present? ? category : ::Services::Category.displayed.roots.first
    end

    def sections
      @sections ||= category.sections.displayed
    end
  end
end
