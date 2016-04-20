require 'rails_helper'

RSpec.describe TestimonialPresenter, type: :presenter, testimonial: true do
  let(:testimonial) { build(:testimonial) }
  subject(:testimonial_presenter) { TestimonialPresenter.new(object: testimonial, view_template: view) }

  pending "add some examples to (or delete) #{__FILE__}"
end
