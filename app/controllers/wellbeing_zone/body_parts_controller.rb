module WellbeingZone
  class BodyPartsController < ApplicationController
    def show
      @body_part = BodyPart.friendly.find(params[:id])
    end
  end
end
