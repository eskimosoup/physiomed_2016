require 'rails_helper'

RSpec.describe Categories::Article, type: :model do
  describe 'validations' do
    it { should belong_to :category }
    it { should belong_to :article }
  end
end
