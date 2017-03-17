class PracticeApplication
  include ActiveModel::Model
  include ActiveModel::Validations

  NUMBERS = [
    '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13',
    '14', '15', '16', '17', '18', '19', '20+'
  ].freeze

  def self.percentages
    0.upto(20).map { |i| "#{5 * i}%" }
  end

  attr_reader :practice
  attr_accessor :name, :address, :county, :postcode, :telephone, :fax, :email,
                :terms_and_conditions, :monday, :tuesday, :wednesday, :thursday, :friday,
                :saturday, :sunday, :capacity, :established, :cancellation_policy,
                :description, :treatment_rooms, :manual_therapy, :tm2_or_pps,
                :initial_assessment_cost, :subsequent_treatment_cost,
                :initial_assessment_duration, :subsequent_treatment_duration,
                :employee_liability_expiry_date, :public_liability_expiry_date
  attr_reader :public_liability_insurance, :employee_liability_insurance,
              :receptionist, :parking_facilities, :online_booking,
              :disabled_access, :bupa_registered, :domiciliary_visits

  attr_reader :first_contact
  attr_accessor :first_contact_name, :first_contact_position

  attr_reader :second_contact
  attr_accessor :second_contact_name, :second_contact_position

  def self.reflect_on_association(association)
    PracticeApplications::Practice.reflect_on_association(association)
  end

  validates :terms_and_conditions, presence: true, inclusion: { in: ['1'], message: 'needs to be ticked' }
  validate :validate_objects

  def practice
    @practice ||= PracticeApplications::Practice.new(
      name: name,
      address: address,
      county: county,
      postcode: postcode,
      telephone: telephone,
      fax: fax,
      email: email,
      public_liability_insurance: public_liability_insurance,
      employee_liability_insurance: employee_liability_insurance,
      monday: monday,
      tuesday: tuesday,
      wednesday: wednesday,
      thursday: thursday,
      friday: friday,
      saturday: saturday,
      sunday: sunday,
      capacity: capacity,
      receptionist: receptionist,
      disabled_access: disabled_access,
      parking_facilities: parking_facilities,
      established: established,
      cancellation_policy: cancellation_policy,
      manual_therapy: manual_therapy,
      description: description,
      treatment_rooms: treatment_rooms,
      tm2_or_pps: tm2_or_pps,
      online_booking: online_booking,
      bupa_registered: bupa_registered,
      domiciliary_visits: domiciliary_visits,
      initial_assessment_cost: initial_assessment_cost,
      subsequent_treatment_cost: subsequent_treatment_cost,
      initial_assessment_duration: initial_assessment_duration,
      subsequent_treatment_duration: subsequent_treatment_duration,
      employee_liability_expiry_date: employee_liability_expiry_date,
      public_liability_expiry_date: public_liability_expiry_date
    )
  end

  def practitioners
    practice.practitioners
  end

  def practitioners_attributes=(attributes)
    attributes.each do |_i, practitioner_params|
      practitioners.build(practitioner_params)
    end
  end

  def first_contact
    @first_contact ||= practice.contacts.new(
      name: first_contact_name,
      position: first_contact_position
    )
  end

  def second_contact
    @second_contact ||= practice.contacts.new(
      name: second_contact_name,
      position: second_contact_position
    )
  end

  def save
    return false unless valid?

    ActiveRecord::Base.transaction do
      practice.save!
      first_contact.save! if first_contact.valid?
      second_contact.save! if second_contact.valid?
      practitioners.each(&:save!)
    end
    true
  end

  def public_liability_insurance=(value)
    @public_liability_insurance = cast_to_boolean(value)
  end

  def employee_liability_insurance=(value)
    @employee_liability_insurance = cast_to_boolean(value)
  end

  def online_booking=(value)
    @online_booking = cast_to_boolean(value)
  end

  def receptionist=(value)
    @receptionist = cast_to_boolean(value)
  end

  def bupa_registered=(value)
    @bupa_registered = cast_to_boolean(value)
  end

  def domiciliary_visits=(value)
    @domiciliary_visits = cast_to_boolean(value)
  end

  def disabled_access=(value)
    @disabled_access = cast_to_boolean(value)
  end

  def parking_facilities=(value)
    @parking_facilities = cast_to_boolean(value)
  end

  private

  def validate_objects
    promote_errors(practice.errors) if practice.invalid?
    promote_errors(first_contact.errors, prefix: 'first_contact_') if promote_contact_errors?(first_contact)
    promote_errors(second_contact.errors, prefix: 'first_contact_') if promote_contact_errors?(second_contact)
  end

  def promote_errors(object_errors, prefix: '')
    object_errors.each do |attribute, message|
      errors.add("#{prefix}#{attribute}", message)
    end
  end

  def promote_contact_errors?(contact)
    some_contact_attributes_present?(contact) && contact.invalid?
  end

  def some_contact_attributes_present?(contact)
    contact.name.present? || contact.position.present?
  end

  def cast_to_boolean(value)
    value == 'true'
  end
end
