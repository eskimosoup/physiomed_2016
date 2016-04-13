class HomesController < ApplicationController
  def show
    @homepage_facade = HomeFacade.new
  end
end
