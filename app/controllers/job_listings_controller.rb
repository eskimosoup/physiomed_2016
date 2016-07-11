class JobListingsController < ApplicationController
  def index
    @job_listings = JobListing.displayed.page(params[:page]).per(10)
  end

  def show
    @job_listing_facade = JobListingFacade.new(job_listing: JobListing.find(params[:id]))
  end
end
