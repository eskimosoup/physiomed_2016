class Contact
  include ActiveModel::Model
  attr_accessor :name, :telephone, :email, :message, :captcha

  validates :name, :telephone, :email, :message, presence: true


  validates :email, email: true


  validates :telephone, telephone: true


  # validate :email_or_telephone

  # def email_or_telephone
  #   errors.add(:email, 'or telephone must be provided') if email.blank? && telephone.blank?
  # end
end
