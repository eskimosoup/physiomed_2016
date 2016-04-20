require 'rails_helper'

RSpec.describe TeamMemberPresenter, type: :presenter, team_member: true do
  let(:team_member) { build(:team_member) }
  subject(:team_member_presenter) { TeamMemberPresenter.new(object: team_member, view_template: view) }

  pending "add some examples to (or delete) #{__FILE__}"
end
