module Optimadmin
  module Mailchimp
    class BaseController < ::Optimadmin::ApplicationController
      private

      helper_method def gibbon
        @gibbon ||= Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])
      end

      helper_method def cquin_list
        '86b326da38'
      end
    end
  end
end
