#
# Website constraint for dynamic checking of the current Website
#
class WebsiteConstraint
  #
  # Microsite check
  #
  # @param [object] request
  #
  # @return [boolean]
  #
  def self.microsite?(request)

    Rails.env.development? ? false : request.domain(2).include?('physioondemand.co.uk')
  end

  #
  # Main site check
  #
  # @param [object] request
  #
  # @return [boolean]
  #
  def self.main_site?(request)
    !microsite?(request)
  end
end
