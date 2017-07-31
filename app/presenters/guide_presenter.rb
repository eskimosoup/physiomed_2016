class GuidePresenter < BasePresenter
  presents :guide
  delegate :gated?, to: :guide

  def linked_download(text, options = {})
    options[:class] = "#{options[:class]} gated-guide-colorbox ga-inline" if options.key?(:class) && gated?
    options.delete(:target) if options.key?(:target) && gated?
    h.link_to text, guide_download_path, options
  end

  private

  def guide_download_path
    gated? ? h.new_guide_download_path(guide) : guide.file.url
  end
end
