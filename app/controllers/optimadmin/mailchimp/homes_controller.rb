module Optimadmin
  module Mailchimp
    class HomesController < BaseController
      def index
        # TODO: Make dynamic
        @list = gibbon.lists(cquin_list).retrieve.body

        @members = gibbon.lists('86b326da38').members.retrieve(params: {"count": 10})
        # @members = gibbon.lists('86b326da38').members.retrieve(params: {"count": @list['stats']['member_count']})
        @campaigns = gibbon.campaigns.retrieve


        respond_to do |format|
          format.csv do
            csv = ::CsvCreator::MailchimpCreator.new(::Mailchimp::Subscriber.all).to_csv
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
