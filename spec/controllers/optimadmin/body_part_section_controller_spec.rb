require 'rails_helper'

describe Optimadmin::BodyPartSectionsController, type: :controller, body_part_section: true do
  routes { Optimadmin::Engine.routes }
  before(:each) do
    sign_in
  end

  describe '#create' do
    context 'when Body part section is valid' do
      it 'redirects to index on normal save' do
        body_part = create(:body_part)
        body_part_section = stub_valid_body_part_section(body_part: body_part)

        post :create, {
          body_part_id: body_part_section.body_part_id,
          body_part_section: body_part_section.attributes,
          commit: 'Save'
        }

        expect(response).to redirect_to(body_part_body_part_sections_path(body_part))
        expect(flash[:notice]).to eq('Body part section was successfully created.')
      end
    end

    context 'when Body part section is invalid' do
      it 'does not redirect' do
        body_part = create(:body_part)
        body_part_section = stub_invalid_body_part_section(body_part: body_part)

        post :create, {
          body_part_id: body_part,
          body_part_section: body_part_section.attributes,
          commit: 'Save'
        }

        expect(response).not_to redirect_to(:index)
      end
    end
  end

  describe '#update' do
    context 'when Body part section is valid' do
      it 'redirects to index on normal save' do
        body_part = create(:body_part)
        body_part_section = stub_valid_body_part_section(body_part: body_part)

        patch :update, {
          id: body_part_section.id,
          body_part_section: body_part_section.attributes,
          commit: 'Save'
        }

        expect(response).to redirect_to(body_part_body_part_sections_path(body_part.id))
        expect(flash[:notice]).to eq('Body part section was successfully updated.')
      end
    end

    context 'when Body part section is invalid' do
      it 'does not redirect' do
        body_part = create(:body_part)
        body_part_section = stub_invalid_body_part_section(body_part: body_part)

        patch :update, {
          id: body_part_section.id,
          body_part_section: body_part_section.attributes,
          commit: 'Save'
        }

        expect(response).not_to redirect_to(:index)
      end
    end
  end


  def stub_valid_body_part_section(body_part: nil)
    body_part_section = build_stubbed(:body_part_section, body_part: body_part)
    allow(BodyPartSection).to receive(:new).and_return(body_part_section)
    allow(body_part_section).to receive(:save).and_return(true)
    allow(BodyPartSection).to receive(:find).and_return(body_part_section)
    allow(body_part_section).to receive(:update).and_return(true)
    body_part_section
  end

  def stub_invalid_body_part_section(body_part: nil)
    body_part_section = build_stubbed(:body_part_section, body_part: body_part)
    allow(BodyPartSection).to receive(:new).and_return(body_part_section)
    allow(body_part_section).to receive(:save).and_return(false)
    allow(BodyPartSection).to receive(:find).and_return(body_part_section)
    allow(body_part_section).to receive(:update).and_return(false)
    body_part_section
  end
end
