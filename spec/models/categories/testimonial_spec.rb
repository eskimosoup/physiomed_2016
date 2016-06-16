require 'rails_helper'

RSpec.describe Categories::Testimonial, type: :model do
  describe 'association' do
    it { should belong_to :category }
    it { should belong_to :testimonial }
  end
end
