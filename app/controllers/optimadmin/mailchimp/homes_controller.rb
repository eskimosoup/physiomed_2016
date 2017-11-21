module Optimadmin
  module Mailchimp
    class HomesController < BaseController
      def index
        # TODO: Make dynamic
        @list = gibbon.lists(cquin_list).retrieve.body

        @members = gibbon.lists('86b326da38').members.retrieve(params: {"count": @list['stats']['member_count']})
        # @member = gibbon.lists('86b326da38').members('9c06c23519d0aa994d6fae3d85e2f2c1').activity.retrieve
        @campaigns = gibbon.campaigns.retrieve
      end
    end
  end
end
