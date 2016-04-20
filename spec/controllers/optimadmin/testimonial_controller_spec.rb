require 'rails_helper'

describe Optimadmin::TestimonialsController, type: :controller, testimonial: true do
  routes { Optimadmin::Engine.routes }
  before(:each) do
    sign_in
  end

  describe '#create' do
    context 'when Testimonial is valid' do
      it 'redirects to index on normal save' do
        testimonial = stub_valid_testimonial

        post :create, {
          testimonial: testimonial.attributes,
          commit: 'Save'
        }

        expect(response).to redirect_to(testimonials_path)
        expect(flash[:notice]).to eq('Testimonial was successfully created.')
      end

      it 'redirects to edit on save and continue editing' do
        testimonial = stub_valid_testimonial

        post :create, {
          testimonial: testimonial.attributes,
          commit: 'Save and continue editing'
        }

        expect(response).to redirect_to(edit_testimonial_path(testimonial))
        expect(flash[:notice]).to eq('Testimonial was successfully created.')
      end
    end

    context 'when Testimonial is invalid' do
      it 'does not redirect' do
        testimonial = stub_invalid_testimonial

        post :create, {
          testimonial: testimonial.attributes,
          commit: 'Save'
        }

        expect(response).not_to redirect_to(:index)
      end
    end
  end

  describe '#update' do
    context 'when Testimonial is valid' do
      it 'redirects to index on normal save' do
        testimonial = stub_valid_testimonial

        patch :update, {
          id: testimonial.id,
          testimonial: testimonial.attributes,
          commit: 'Save'
        }

        expect(response).to redirect_to(testimonials_path)
        expect(flash[:notice]).to eq('Testimonial was successfully updated.')
      end

      it 'redirects to edit on save and continue editing' do
        testimonial = stub_valid_testimonial

        patch :update, {
          id: testimonial.id,
          testimonial: testimonial.attributes,
          commit: 'Save and continue editing'
        }

        expect(response).to redirect_to(edit_testimonial_path(testimonial))
        expect(flash[:notice]).to eq('Testimonial was successfully updated.')
      end
    end

    context 'when Testimonial is invalid' do
      it 'does not redirect' do
        testimonial = stub_invalid_testimonial

        patch :update, {
          id: testimonial.id,
          testimonial: testimonial.attributes,
          commit: 'Save'
        }

        expect(response).not_to redirect_to(:index)
      end
    end
  end

  def stub_valid_testimonial
    testimonial = build_stubbed(:testimonial)
    allow(Testimonial).to receive(:new).and_return(testimonial)
    allow(testimonial).to receive(:save).and_return(true)
    allow(Testimonial).to receive(:find).and_return(testimonial)
    allow(testimonial).to receive(:update).and_return(true)
    testimonial
  end

  def stub_invalid_testimonial
    testimonial = build_stubbed(:testimonial)
    allow(Testimonial).to receive(:new).and_return(testimonial)
    allow(testimonial).to receive(:save).and_return(false)
    allow(Testimonial).to receive(:find).and_return(testimonial)
    allow(testimonial).to receive(:update).and_return(false)
    testimonial
  end
end
