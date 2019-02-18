class PhysiosController < ApplicationController
  http_basic_authenticate_with(
    name: ENV['PHYSIOMED_2016_PHYSIO_USERNAME'], password: ENV['PHYSIOMED_2016_PHYSIO_PASSWORD']
  )

  def index
  end
end
