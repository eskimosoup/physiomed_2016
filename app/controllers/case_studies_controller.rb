class CaseStudiesController < ApplicationController
  def index
    @case_studies = CaseStudy.displayed.order_by(date: :desc).page(params[:page]).per(10)
  end

  def show
    @case_study = CaseStudy.displayed.friendly.find(params[:id])
  end

end
