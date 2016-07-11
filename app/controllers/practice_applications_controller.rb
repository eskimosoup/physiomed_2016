class PracticeApplicationsController < ApplicationController
  def new
    @practice_application = PracticeApplication.new
  end

  def create
    @practice_application = PracticeApplication.new(practice_application_params)
    if @practice_application.save
      PracticeApplicationMailer.application_made(@practice_application.practice).deliver_now
      redirect_to new_practice_application_path, notice: I18n.t('practice_applications.create.flash')
    else
      render :new
    end
  end

  private

  def practice_application_params
    params.require(:practice_application).permit(
      :name, :address, :county, :postcode, :telephone, :fax, :email,
      :first_contact_name, :first_contact_position, :second_contact_name,
      :second_contact_position, :public_liability_insurance, 
      :employee_liability_insurance, :full_time, :part_time, :male, :female,
      :monday, :tuesday, :wednesday, :thursday, :friday, :number_of_locations,
      :capacity, :receptionist, :parking_facilities, :established, :word_access,
      :cancellation_policy, :cheques_payable_to, :description, :treatment_rooms,
      :treatment_min_time, :initial_assessment_cost, :subsequent_treatment_cost,
      :image_1, :image_2, :image_3, :terms_and_conditions,
      practitioners_attributes: [:name, :csp_number, :hpc_number, :ocppp_member,
      :qualification_date, :years_practicing, :specialisation_areas,
      :domiciliary_visits, :manual_treatments, :bupa_registered, :cpd]
    )
  end
end
