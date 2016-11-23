module ClientZone
  class HomesController < BaseController
    def show
      @additional_content = AdditionalContent.displayed.find_by(area: 'client_zone_home')
      categories = Category.where(name: ['General Wellbeing', 'Wellbeing Zone Overview'])
      @general_wellbeing_category = categories.detect { |x| x.name == 'General Wellbeing' }
      @wellbeing_facade = WellbeingFacade.new(
        categories.detect { |x| x.name == 'Wellbeing Zone Overview' }
      )
    end
  end
end
