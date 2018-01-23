module Optimadmin
  module Mailchimp
    class HomesController < BaseController
      def index
        @list = gibbon.lists(cquin_list).retrieve.body
        # @members = gibbon.lists('86b326da38').members.retrieve(params: {"count": @list['stats']['member_count'], "status": 'subscribed'})
        @processor =  ::Mailchimp::Processor.order(updated_at: :desc).first

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
