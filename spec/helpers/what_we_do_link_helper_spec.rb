require 'rails_helper'

RSpec.describe WhatWeDoLinkHelper, type: :helper do
  describe '#link_class' do
    it 'link is current link' do
      what_we_do_link = build(:what_we_do_link)

      result = helper.link_class(link: what_we_do_link, current: what_we_do_link)

      expect(result).to eq('current')
    end

    it 'link is not current link' do
      what_we_do_link = build(:what_we_do_link)
      second_link = build(:what_we_do_link)

      result = helper.link_class(link: what_we_do_link, current: second_link)

      expect(result).to eq('not-current')
    end
  end
end
