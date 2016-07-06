module WellbeingZone
  class BodyPartsController < ApplicationController
    def show
      body_part = BodyPart.displayed.friendly.find(params[:id])
      @body_part_facade = BodyPartFacade.new(body_part)
    end
  end
end
