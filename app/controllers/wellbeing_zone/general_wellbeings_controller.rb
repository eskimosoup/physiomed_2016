module WellbeingZone
  class GeneralWellbeingsController < ApplicationController
    def show
      @general_wellbeing_facade = GeneralWellbeingFacade.new(
        Category.find_by(name: 'General Wellbeing')
      )
    end
  end
end
