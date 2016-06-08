require 'rails_helper'

describe Optimadmin::PeopleHelpedSectionsController, type: :controller, people_helped_section: true do
  routes { Optimadmin::Engine.routes }
  before(:each) do
    sign_in
  end

  describe '#create' do
    context 'when People helped section is valid' do
      it 'redirects to index on normal save' do
        people_helped_section = stub_valid_people_helped_section

        post :create, {
          people_helped_section: people_helped_section.attributes,
          commit: 'Save'
        }

        expect(response).to redirect_to(people_helped_sections_path)
        expect(flash[:notice]).to eq('People helped section was successfully created.')
      end

      it 'redirects to edit on save and continue editing' do
        people_helped_section = stub_valid_people_helped_section

        post :create, {
          people_helped_section: people_helped_section.attributes,
          commit: 'Save and continue editing'
        }

        expect(response).to redirect_to(edit_people_helped_section_path(people_helped_section))
        expect(flash[:notice]).to eq('People helped section was successfully created.')
      end
    end

    context 'when People helped section is invalid' do
      it 'does not redirect' do
        people_helped_section = stub_invalid_people_helped_section

        post :create, {
          people_helped_section: people_helped_section.attributes,
          commit: 'Save'
        }

        expect(response).not_to redirect_to(:index)
      end
    end
  end

  describe '#update' do
    context 'when People helped section is valid' do
      it 'redirects to index on normal save' do
        people_helped_section = stub_valid_people_helped_section

        patch :update, {
          id: people_helped_section.id,
          people_helped_section: people_helped_section.attributes,
          commit: 'Save'
        }

        expect(response).to redirect_to(people_helped_sections_path)
        expect(flash[:notice]).to eq('People helped section was successfully updated.')
      end

      it 'redirects to edit on save and continue editing' do
        people_helped_section = stub_valid_people_helped_section

        patch :update, {
          id: people_helped_section.id,
          people_helped_section: people_helped_section.attributes,
          commit: 'Save and continue editing'
        }

        expect(response).to redirect_to(edit_people_helped_section_path(people_helped_section))
        expect(flash[:notice]).to eq('People helped section was successfully updated.')
      end
    end

    context 'when People helped section is invalid' do
      it 'does not redirect' do
        people_helped_section = stub_invalid_people_helped_section

        patch :update, {
          id: people_helped_section.id,
          people_helped_section: people_helped_section.attributes,
          commit: 'Save'
        }

        expect(response).not_to redirect_to(:index)
      end
    end
  end

  def stub_valid_people_helped_section
    people_helped_section = build_stubbed(:people_helped_section)
    allow(PeopleHelpedSection).to receive(:new).and_return(people_helped_section)
    allow(people_helped_section).to receive(:save).and_return(true)
    allow(PeopleHelpedSection).to receive(:find).and_return(people_helped_section)
    allow(people_helped_section).to receive(:update).and_return(true)
    people_helped_section
  end

  def stub_invalid_people_helped_section
    people_helped_section = build_stubbed(:people_helped_section)
    allow(PeopleHelpedSection).to receive(:new).and_return(people_helped_section)
    allow(people_helped_section).to receive(:save).and_return(false)
    allow(PeopleHelpedSection).to receive(:find).and_return(people_helped_section)
    allow(people_helped_section).to receive(:update).and_return(false)
    people_helped_section
  end
end
