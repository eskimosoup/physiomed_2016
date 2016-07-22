module WellbeingZone
  class WellbeingsController < ApplicationController
    def show
      categories = Category.where(name: ['General Wellbeing', 'Wellbeing Zone Overview'])
      @general_wellbeing_category = categories.detect{|x| x.name == 'General Wellbeing' }
      @wellbeing_facade = WellbeingFacade.new(
        categories.detect{|x| x.name == 'Wellbeing Zone Overview' }
      )
    end
  end
end
