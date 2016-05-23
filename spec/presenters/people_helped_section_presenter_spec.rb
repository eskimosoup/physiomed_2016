require 'rails_helper'

RSpec.describe PeopleHelpedSectionPresenter, type: :presenter, people_helped_section: true do
  let(:people_helped_section) { build(:people_helped_section) }
  subject(:people_helped_section_presenter) { PeopleHelpedSectionPresenter.new(object: people_helped_section, view_template: view) }

  pending "add some examples to (or delete) #{__FILE__}"
end
