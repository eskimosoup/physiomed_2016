module WellbeingZone
  class GuidesController < ApplicationController
    def index
      @body_part_facade = body_part_facade
    end

    def general_wellbeing
      @general_wellbeing_facade = GeneralWellbeingFacade.new(
        Category.find_by(name: 'General Wellbeing')
      )
    end

    private

    def body_part_facade
      BodyPartFacade.new(body_part)
    end

    def body_part
      BodyPart.displayed.friendly.find(params[:body_part_id])
    end
  end
end
