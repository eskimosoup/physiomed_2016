module Optimadmin
  module Mailchimp
    class EmailsController < BaseController
      def index
        Thread.new do
          Mailchimp::Processor.process
        end

        redirect_to mailchimp_root_path
      end
    end
  end
end
