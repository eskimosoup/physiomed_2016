module WellbeingZone
  class BodyPartsController < ApplicationController
    def show
      @body_part_facade = BodyPartFacade.new(BodyPart.displayed.friendly.find(params[:id]))
    end
  end
end
