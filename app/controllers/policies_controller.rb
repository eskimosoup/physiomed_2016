class PoliciesController < ApplicationController
  def index
    @facade = PolicyFacade.new
  end
end
