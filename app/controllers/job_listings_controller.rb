class JobListingsController < ApplicationController
  def index
    #@job_listings = JobListing.displayed.page(params[:page]).per(10)
    redirect_to Page.displayed.find_by(style: 'careers'), status: :moved_permanently
  end

  def show
    @job_listing_facade = JobListingFacade.new(job_listing: JobListing.find(params[:id]))

    respond_to do |format|
      format.html
      format.all { head(:unprocessable_entity) }
    end
  end
end
