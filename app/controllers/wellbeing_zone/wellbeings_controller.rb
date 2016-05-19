module WellbeingZone
  class WellbeingsController < ApplicationController
    def show
      @wellbeing_facade = WellbeingFacade.new
    end
  end
end
