require 'rails_helper'

describe Optimadmin::CaseStudiesController, type: :controller, case_study: true do
  routes { Optimadmin::Engine.routes }
  before(:each) do
    sign_in
  end

  describe '#create' do
    context 'when Case study is valid' do
      it 'redirects to index on normal save' do
        case_study = stub_valid_case_study

        process :create, method: :post, params: {
          case_study: case_study.attributes,
          commit: 'Save'
        }

        expect(response).to redirect_to(case_studies_path)
        expect(flash[:notice]).to eq('Case study was successfully created.')
      end

      it 'redirects to edit on save and continue editing' do
        case_study = stub_valid_case_study

        process :create, method: :post, params: {
          case_study: case_study.attributes,
          commit: 'Save and continue editing'
        }

        expect(response).to redirect_to(edit_case_study_path(case_study))
        expect(flash[:notice]).to eq('Case study was successfully created.')
      end
    end

    context 'when Case study is invalid' do
      it 'does not redirect' do
        case_study = stub_invalid_case_study

        process :create, method: :post, params: {
          case_study: case_study.attributes,
          commit: 'Save'
        }

        expect(response).not_to redirect_to(:index)
      end
    end
  end

  describe '#update' do
    context 'when Case study is valid' do
      it 'redirects to index on normal save' do
        case_study = stub_valid_case_study

        process :update, method: :patch, params: {
          id: case_study.id,
          case_study: case_study.attributes,
          commit: 'Save'
        }

        expect(response).to redirect_to(case_studies_path)
        expect(flash[:notice]).to eq('Case study was successfully updated.')
      end

      it 'redirects to edit on save and continue editing' do
        case_study = stub_valid_case_study

        process :update, method: :patch, params: {
          id: case_study.id,
          case_study: case_study.attributes,
          commit: 'Save and continue editing'
        }

        expect(response).to redirect_to(edit_case_study_path(case_study))
        expect(flash[:notice]).to eq('Case study was successfully updated.')
      end
    end

    context 'when Case study is invalid' do
      it 'does not redirect' do
        case_study = stub_invalid_case_study

        process :update, method: :patch, params: {
          id: case_study.id,
          case_study: case_study.attributes,
          commit: 'Save'
        }

        expect(response).not_to redirect_to(:index)
      end
    end
  end

  def stub_valid_case_study
    case_study = build_stubbed(:case_study)
    allow(CaseStudy).to receive(:new).and_return(case_study)
    allow(case_study).to receive(:save).and_return(true)
    allow(CaseStudy).to receive_message_chain(:friendly, :find).and_return(case_study)
    allow(case_study).to receive(:update).and_return(true)
    case_study
  end

  def stub_invalid_case_study
    case_study = build_stubbed(:case_study)
    allow(CaseStudy).to receive(:new).and_return(case_study)
    allow(case_study).to receive(:save).and_return(false)
    allow(CaseStudy).to receive_message_chain(:friendly, :find).and_return(case_study)
    allow(case_study).to receive(:update).and_return(false)
    case_study
  end
end
