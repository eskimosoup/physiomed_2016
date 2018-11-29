module Services
  class CategoryFacade
    attr_reader :category

    delegate :title, :content, :style, to: :category, prefix: true
    delegate :title, to: :parent_category, prefix: true, allow_nil: true

    def initialize(category = nil)
      @category = category.present? ? category : ::Services::Category.displayed.roots.first
    end

    def sections
      @sections ||= category.sections.displayed
    end

    def parent_category
      @parent_category ||= Category.roots.displayed.first
    end

    def parent_category?
      parent_category.present?
    end

    def services
      @services ||= Service.all.displayed
    end

    def services?
      services.present?
    end

    def offerings
      @offerings ||= Offering.all.displayed
    end

    def offerings?
      offerings.present?
    end
  end
end
