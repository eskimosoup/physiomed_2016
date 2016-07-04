require 'rails_helper'

RSpec.describe Pages::TeamMember, type: :model do
  describe 'associations', :association do
    it { should belong_to(:page) }
    it { should belong_to(:team_member) }
  end
end
