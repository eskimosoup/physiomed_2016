module WellbeingZone
  class WellbeingsController < ApplicationController
    def show
      @general_wellbeing_category = Category.find_by(name: 'General Wellbeing')
      @wellbeing_facade = WellbeingFacade.new(Category.find_by(name: 'Wellbeing Zone Overview'))
    end
  end
end
