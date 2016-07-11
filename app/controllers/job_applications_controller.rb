class JobApplicationsController < ApplicationController
  def create
    if job_application.save
      JobApplicationMailer.application_made(job_application, job_listing).deliver_now
      redirect_to job_listing, notice: I18n.t('job_applications.create.flash')
    else
      @job_listing_facade = JobListingFacade.new(
        job_listing: job_listing,
        job_application: job_application
      )
      render template: 'job_listings/show'
    end
  end

  private

  def job_listing
    @job_listing ||= JobListing.find(params[:job_listing_id])
  end

  def job_application
    @job_application ||= job_listing.job_applications.new(job_listing_params)
  end

  def job_listing_params
    params.require(:job_application).permit(
      :name, :telephone, :email, :cv
    )
  end
end
