module Optimadmin
  class JobListingsController < Optimadmin::ApplicationController
    def index
      @job_listings = JobListing.order(display_from: :desc).page(params[:page]).per(10)
    end

    def new
      @job_listing = JobListing.new
    end

    def create
      @job_listing = JobListing.new(job_listing_params)
      if @job_listing.save
        redirect_to_index_or_continue_editing(@job_listing)
      else
        render :new
      end
    end

    def edit
      @job_listing = find_job_listing
    end

    def update
      @job_listing = find_job_listing
      if @job_listing.update(job_listing_params)
        redirect_to_index_or_continue_editing(@job_listing)
      else
        render :edit
      end
    end

    def destroy
      @job_listing = find_job_listing
      @job_listing.destroy
      redirect_to job_listings_url, notice: "Job listing successfully destroyed"
    end

    private

    def find_job_listing
      JobListing.find(params[:id])
    end

    def job_listing_params
      params.require(:job_listing).permit(
        :title, :summary, :description, :display_from, :display_until, :display
      )
    end
  end
end
