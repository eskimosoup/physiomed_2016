module ClientZone
  class GuidesController < BaseController
    def index
      categories = Category.where(name: ['General Wellbeing', 'Wellbeing Zone Overview'])
      @general_wellbeing_category = categories.detect { |x| x.name == 'General Wellbeing' }
      @wellbeing_facade = WellbeingFacade.new(
        categories.detect { |x| x.name == 'Wellbeing Zone Overview' }
      )
    end

    def show
      @body_part = BodyPart.displayed.friendly.find(params[:id])
      @body_part_facade = BodyPartFacade.new(@body_part)
    end

    def general_well_being
      @general_wellbeing_facade = GeneralWellbeingFacade.new(
        Category.find_by(name: 'General Wellbeing')
      )
    end
  end
end
