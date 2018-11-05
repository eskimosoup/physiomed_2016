# frozen_string_literal: true
require 'render_anywhere'

class PracticeApplicationFormCreator
  include RenderAnywhere

  def initialize(practice_application)
    @practice_application = practice_application
  end

  def call
    to_pdf
    send_email
    remove_temp_file
  end

  def send_email
    PracticeApplicationMailer.application_made(practice_application, file_path, file_name).deliver_now
  end

  def to_pdf
    kit = PDFKit.new(as_html, page_size: 'A4')
    kit.to_file(file_path)
    practice_application.update_attributes!(document: File.open(file_path))
  end

  def file_path
    File.join(Rails.root, 'tmp', 'uploads', file_name)
  end

  def file_name
    "#{[practice_application.id, sanitize_filename(practice_application.name), practice_application.created_at.to_s.gsub(/[^0-9A-Za-z.\-]/, '_')].join('-')}.pdf"
  end

  def remove_temp_file
    File.delete(file_path)
  end

  private

  def sanitize_filename(filename)
    filename.gsub!(/[^0-9A-Za-z.\-]/, '_')
  end

  def render_attributes
    {
      template: 'practice_applications/pdf',
      layout: 'pdf',
      locals: { practice_application: practice_application }
    }
  end

  def as_html
    render render_attributes
  end

  attr_reader :practice_application
end
