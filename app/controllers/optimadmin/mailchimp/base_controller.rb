module Optimadmin
  module Mailchimp
    class BaseController < ::Optimadmin::ApplicationController
      private

      helper_method def gibbon
        @gibbon ||= Gibbon::Request.new(api_key: ENV['PHYSIOMED_2016_MAILCHIMP_API_KEY'])
      end

      helper_method def cquin_list
        ::Mailchimp::Processor::MAILCHIMP_LIST
      end
    end
  end
end
