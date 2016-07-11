require 'rails_helper'

RSpec.describe 'rendering sidebar' do
  context 'has testimonials' do
    it 'renders the testimonials' do
      testimonials = build_list(:testimonial, 2)

      render partial: "shared/sidebar",
        locals: {
          call_to_action: false,
          testimonials: testimonials,
          team_members: nil,
          health_zone: nil,
          case_studies: nil,
          articles: nil,
        }

      expect(rendered).to have_testimonials
    end
  end

  context 'has no testimonials' do
    it 'does not render the testimonials' do
      render partial: "shared/sidebar",
        locals: {
          call_to_action: false,
          testimonials: nil,
          team_members: nil,
          health_zone: nil,
          case_studies: nil,
          articles: nil,
        }

      expect(rendered).not_to have_testimonials
    end
  end

  context 'call to action is true' do
    it 'renders the call to action' do
      # to stub view
      def view.global_site_settings
        {}
      end

      render partial: "shared/sidebar",
        locals: {
          call_to_action: true,
          testimonials: nil,
          team_members: nil,
          health_zone: nil,
          case_studies: nil,
          articles: nil,
        }

      expect(rendered).to have_call_to_action
    end
  end

  context 'call to action is true' do
    it 'renders the call to action' do
      render partial: "shared/sidebar",
        locals: {
          call_to_action: false,
          testimonials: nil,
          team_members: nil,
          health_zone: nil,
          case_studies: nil,
          articles: nil,
        }

      expect(rendered).not_to have_call_to_action
    end
  end

  context 'has an team_members' do
    it 'renders the team_members' do
      team_members = build_list(:team_member, 2)
      render partial: "shared/sidebar",
        locals: {
          call_to_action: false,
          testimonials: nil,
          team_members: team_members,
          health_zone: nil,
          case_studies: nil,
          articles: nil,
        }

      expect(rendered).to have_team_members
    end
  end

  context 'has no team_members' do
    it 'does not render the team_members' do
      render partial: "shared/sidebar",
        locals: {
          call_to_action: false,
          testimonials: nil,
          team_members: nil,
          health_zone: nil,
          case_studies: nil,
          articles: nil,
        }

      expect(rendered).not_to have_team_members
    end
  end

  context 'has health_zone' do
    it 'renders health zone' do
      health_zone = build(:health_zone)
      render partial: "shared/sidebar",
        locals: {
          call_to_action: false,
          testimonials: nil,
          team_members: nil,
          health_zone: health_zone,
          case_studies: nil,
          articles: nil,
        }

      expect(rendered).to have_health_zone
    end
  end

  context 'has health_zone' do
    it 'renders health zone' do
      render partial: "shared/sidebar",
        locals: {
          call_to_action: false,
          testimonials: nil,
          team_members: nil,
          health_zone: nil,
          case_studies: nil,
          articles: nil,
        }

      expect(rendered).not_to have_health_zone
    end
  end

  context 'has case studies' do
    it 'renders case studies' do
      case_studies = build_list(:case_study, 2)
      render partial: "shared/sidebar",
        locals: {
          call_to_action: false,
          testimonials: nil,
          team_members: nil,
          health_zone: nil,
          case_studies: case_studies,
          articles: nil,
        }

      expect(rendered).to have_case_studies
    end
  end

  context 'has no case studies' do
    it 'does not render case studies' do
      render partial: "shared/sidebar",
        locals: {
          call_to_action: false,
          testimonials: nil,
          team_members: nil,
          health_zone: nil,
          case_studies: nil,
          articles: nil,
        }

      expect(rendered).not_to have_case_studies
    end
  end

  context 'has articles' do
    it 'renders articles' do
      articles = build_list(:article, 2)
      render partial: "shared/sidebar",
        locals: {
          call_to_action: false,
          testimonials: nil,
          team_members: nil,
          health_zone: nil,
          case_studies: nil,
          articles: articles,
        }

      expect(rendered).to have_articles
    end
  end

  context 'has no articles' do
    it 'does not render case studies' do
      render partial: "shared/sidebar",
        locals: {
          call_to_action: false,
          testimonials: nil,
          team_members: nil,
          health_zone: nil,
          case_studies: nil,
          articles: nil,
        }

      expect(rendered).not_to have_articles
    end
  end

  def have_testimonials
    have_css 'div[data-role="sidebar-testimonials"]'
  end

  def have_call_to_action
    have_css 'div[data-role="sidebar-cta"]'
  end

  def have_team_members
    have_css 'div[data-role="sidebar-team-members"]'
  end

  def have_health_zone
    have_css 'div[data-role="sidebar-health-zone"]'
  end

  def have_case_studies
    have_css 'div[data-role="sidebar-case-studies"]'
  end

  def have_articles
    have_css 'div[data-role="sidebar-articles"]'
  end
end
