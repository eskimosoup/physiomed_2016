require 'rails_helper'

RSpec.describe VideoPresenter, type: :presenter, video: true do
  let(:video) { build(:video) }
  subject(:video_presenter) { VideoPresenter.new(object: video, view_template: view) }

  pending "add some examples to (or delete) #{__FILE__}"
end
