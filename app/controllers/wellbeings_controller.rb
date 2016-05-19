class WellbeingsController < ApplicationController
  def show
    @facade = WellbeingFacade.new
  end
end
