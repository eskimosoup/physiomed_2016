module Optimadmin
  class JobApplicationsController < Optimadmin::ApplicationController
    def index
      @job_listing = find_job_listing
      @job_applications = @job_listing.job_applications
    end

    private

    def find_job_listing
      JobListing.find(params[:job_listing_id])
    end
  end
end
