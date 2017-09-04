class GuidePresenter < BasePresenter
  presents :guide
  delegate :gated?, :optionally_gated?, to: :guide

  def linked_download(text, options = {}, params = {})
    options[:class] = "#{options[:class]} gated-guide-colorbox ga-inline" if options.key?(:class) && gated?
    options[:class] = "#{options[:class]} ga-inline" if options.key?(:class) && optionally_gated?
    options.delete(:target) if options.key?(:target) && gated?
    if optionally_gated?
      h.link_to text, guide_download_path, options.merge(remote: true)
    else
      h.link_to text, guide_download_path, options
    end
  end

  private

  def guide_download_path
    if gated?
      h.new_guide_download_path(guide)
    elsif optionally_gated?
      h.optional_guide_downloads_path(
        guide,
        email: h.params[:email],
        utm_source: h.params[:utm_source],
        utm_campaign: h.params[:utm_campaign],
        utm_medium: h.params[:utm_medium],
        utm_term: h.params[:utm_term]
      )
    else
      guide.file.url
    end
  end
end
