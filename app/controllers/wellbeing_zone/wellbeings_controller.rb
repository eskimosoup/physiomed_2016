module WellbeingZone
  class WellbeingsController < ApplicationController
    def show
      @wellbeing_facade = WellbeingFacade.new(Category.find_by(name: "Wellbeing Zone Overview"))
    end
  end
end
