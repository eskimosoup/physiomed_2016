class WellbeingsController < ApplicationController
  def index
    @health_zones = HealthZone.displayed.ordered_by_position
  end
end
