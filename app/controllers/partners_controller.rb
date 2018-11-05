class PartnersController < ApplicationController
  def index
    @partners = Partner.displayed
  end
end
