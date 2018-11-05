# == Schema Information
#
# Table name: client_zone_users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  auth_token      :string           not null
#  active          :boolean          default(TRUE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

module ClientZone
  class User < ActiveRecord::Base
    require_dependency 'client_zone'

    include OptimadminScopes

    validates :username,
              presence: true,
              uniqueness: {
                case_sensitive: false,
                message: 'is already taken'
              }

    has_secure_password

    scope :active, -> { where(active: true) }

    before_create :generate_auth_token

    def generate_auth_token
      self.auth_token = digest
    end

    private

    def token
      SecureRandom.urlsafe_base64
    end

    def digest
      Digest::SHA1.hexdigest(token.to_s)
    end
  end
end
