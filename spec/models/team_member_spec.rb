# == Schema Information
#
# Table name: team_members
#
#  id         :integer          not null, primary key
#  forename   :string           not null
#  surname    :string           not null
#  image      :string
#  bio        :text
#  email      :string
#  phone      :string
#  role       :string           not null
#  display    :boolean          default(TRUE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#  position   :integer          default(0), not null
#

require 'rails_helper'

RSpec.describe TeamMember, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:forename) }
    it { should validate_presence_of(:surname) }
    it { should validate_presence_of(:role) }
  end

  describe 'associations' do
    it { should have_many(:page_team_members).dependent(:destroy).class_name('Pages::TeamMember') }
    it { should have_many(:pages).through(:page_team_members) }
    it { should have_many(:articles).with_foreign_key(:author_id) }
  end

  it '#name' do
    team_member = build(:team_member, forename: 'Joe', surname: 'Bloggs')
    expect(team_member.name).to eq('Joe Bloggs')
  end
end
