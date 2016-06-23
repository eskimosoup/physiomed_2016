class StaticPagesController < ApplicationController
  def show
    @facade = facade_class.new
    render_template
  end

  private

  def render_template
    render template: "static_pages/#{ params[:id] }"
  end

  def facade_class
    case params[:id]
    when "what_we_do"
      WhatWeDoFacade
    end
  end
end
