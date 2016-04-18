require 'rails_helper'

RSpec.describe PracticePresenter, type: :presenter, practice: true do
  let(:practice) { build(:practice) }
  subject(:practice_presenter) { PracticePresenter.new(object: practice, view_template: view) }

  pending "add some examples to (or delete) #{__FILE__}"
end
