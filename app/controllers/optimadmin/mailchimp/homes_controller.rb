module Optimadmin
  module Mailchimp
    class HomesController < BaseController
      def index
        @list = gibbon.lists(cquin_list).retrieve.body

        respond_to do |format|
          format.html
          format.csv do
            csv = ::CsvCreator::MailchimpEmailCreator.new(::Mailchimp::Subscriber.all.order(:id)).to_csv
            send_data csv,
                      type: 'text/csv; charset=iso-8859-1; header=present',
                      disposition: 'attachment',
                      filename: 'mailchimp.csv'
          end
        end

      end
    end
  end
end
