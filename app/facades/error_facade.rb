# frozen_string_literal: true

class ErrorFacade
  delegate :title, :content,
           to: :additional_content,
           prefix: true,
           allow_nil: true

  def initialize(status_code)
    @status_code = status_code.to_i
  end

  def title
    additional_content_title? ? additional_content_title : I18n.t("views.errors.#{status_code}.title")
  end

  def additional_content_title?
    additional_content.present? && additional_content_title.present?
  end

  def content
    additional_content.present? ? additional_content_content : raw_content(I18n.t("views.errors.#{status_code}.content"))
  end

  def additional_content_content?
    additional_content.present? && additional_content_content.present?
  end

  private

  def raw_content(content)
    "<p>#{content}</p>"
  end

  def additional_content
    @additional_content ||= AdditionalContent.select(:title, :content)
                                             .displayed
                                             .find_by(area: "error_#{status_code}")
  end

  attr_reader :status_code
end
