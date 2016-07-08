module WellbeingZone
  class GeneralWellbeingsController < ApplicationController
    def show
      @category = Category.find_by(name: 'General Wellbeing')
      @general_wellbeing_facade = GeneralWellbeingFacade.new(
        @category
      ) if @category.present?
    end
  end
end
