module Optimadmin
  module Mailchimp
    class SubscribersController < BaseController
      def show
        # @member = gibbon.lists(cquin_list).members(params[:email_id]).retrieve
        # @activity = gibbon.lists(cquin_list).members(params[:email_id]).activity.retrieve

        respond_to do |format|
          format.html
          format.csv do
            csv = ::CsvCreator::MailchimpSubscriberCreator.new(::Mailchimp::Subscriber.all).to_csv
            send_data csv,
                      type: 'text/csv; charset=iso-8859-1; header=present',
                      disposition: 'attachment',
                      filename: 'list.csv'
          end
        end
      end
    end
  end
end
