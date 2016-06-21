module WellbeingZone
  class BodyPartsController < ApplicationController
    def show
      body_part = BodyPart.displayed.friendly.find(params[:id])
      @body_part_facade = BodyPartFacade.new(body_part)
      @body_parts = BodyPart.includes(:category).displayed.where.not(id: body_part.id).order('categories.name asc')
    end
  end
end
