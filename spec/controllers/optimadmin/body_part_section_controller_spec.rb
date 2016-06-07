require 'rails_helper'

describe Optimadmin::BodyPartSectionsController, type: :controller, body_part_section: true do
  routes { Optimadmin::Engine.routes }
  before(:each) do
    sign_in
  end

  describe '#create' do
    context 'when Body part section is valid' do
      it 'redirects to index on normal save' do
        body_part_section = stub_valid_body_part_section

        process :create, method: :post, params: {
          body_part_section: body_part_section.attributes,
          commit: 'Save'
        }

        expect(response).to redirect_to(body_part_sections_path)
        expect(flash[:notice]).to eq('Body part section was successfully created.')
      end

      it 'redirects to edit on save and continue editing' do
        body_part_section = stub_valid_body_part_section

        process :create, method: :post, params: {
          body_part_section: body_part_section.attributes,
          commit: 'Save and continue editing'
        }

        expect(response).to redirect_to(edit_body_part_section_path(body_part_section))
        expect(flash[:notice]).to eq('Body part section was successfully created.')
      end
    end

    context 'when Body part section is invalid' do
      it 'does not redirect' do
        body_part_section = stub_invalid_body_part_section

        process :create, method: :post, params: {
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
        body_part_section = stub_valid_body_part_section

        process :update, method: :patch, params: {
          id: body_part_section.id,
          body_part_section: body_part_section.attributes,
          commit: 'Save'
        }

        expect(response).to redirect_to(body_part_sections_path)
        expect(flash[:notice]).to eq('Body part section was successfully updated.')
      end

      it 'redirects to edit on save and continue editing' do
        body_part_section = stub_valid_body_part_section

        process :update, method: :patch, params: {
          id: body_part_section.id,
          body_part_section: body_part_section.attributes,
          commit: 'Save and continue editing'
        }

        expect(response).to redirect_to(edit_body_part_section_path(body_part_section))
        expect(flash[:notice]).to eq('Body part section was successfully updated.')
      end
    end

    context 'when Body part section is invalid' do
      it 'does not redirect' do
        body_part_section = stub_invalid_body_part_section

        process :update, method: :patch, params: {
          id: body_part_section.id,
          body_part_section: body_part_section.attributes,
          commit: 'Save'
        }

        expect(response).not_to redirect_to(:index)
      end
    end
  end

  def stub_valid_body_part_section
    body_part_section = build_stubbed(:body_part_section)
    allow(BodyPartSection).to receive(:new).and_return(body_part_section)
    allow(body_part_section).to receive(:save).and_return(true)
    allow(BodyPartSection).to receive_message_chain(:friendly, :find).and_return(body_part_section)
    allow(body_part_section).to receive(:update).and_return(true)
    body_part_section
  end

  def stub_invalid_body_part_section
    body_part_section = build_stubbed(:body_part_section)
    allow(BodyPartSection).to receive(:new).and_return(body_part_section)
    allow(body_part_section).to receive(:save).and_return(false)
    allow(BodyPartSection).to receive_message_chain(:friendly, :find).and_return(body_part_section)
    allow(body_part_section).to receive(:update).and_return(false)
    body_part_section
  end
end
