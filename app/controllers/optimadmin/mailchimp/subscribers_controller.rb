module Optimadmin
  module Mailchimp
    class SubscribersController < BaseController
      def show
        @member = gibbon.lists(cquin_list).members(params[:email_id]).retrieve
        @activity = gibbon.lists(cquin_list).members(params[:email_id]).activity.retrieve
      end
    end
  end
end
