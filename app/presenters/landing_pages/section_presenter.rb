module LandingPages
  class SectionPresenter < BasePresenter
    presents :section

    delegate :title, :sub_title, :sub_title?, :button?, to: :section

    def header(header_level = :h1, options = {})
      h.content_tag(header_level, section.title, options) if section.title?
    end

    def linked_text(text = 'View', options = {})
      h.link_to(text, h.section_path(section), options) if text.present?
    end

    def linked_block(options = {})
      h.link_to h.section_path(section), options do
        yield
      end
    end

    def content
      h.raw(section.content) if section.content?
    end

    def image(crop, options = {})
      return unless section.image?

      if crop.present?
        h.image_tag(section.image.public_send(crop).url, options)
      else
        h.image_tag(section.image.url, options)
      end
    end

    def button(options = {})
      h.link_to(section.button_text, section.button_link, options) if button?
    end

    def background_image_styles
      return unless section.image?

      "style=background:url('#{section.image.url}') no-repeat center;"
    end
  end
end
