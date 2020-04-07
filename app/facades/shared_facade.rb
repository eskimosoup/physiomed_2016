class SharedFacade
  def notice_bar
    @notice_bar ||= AdditionalContent.displayed.find_by(area: 'notice_bar')
  end

  def notice_modal
    @notice_modal ||= AdditionalContent.displayed.find_by(area: 'notice_modal')
  end

  def notice_bar?
    notice_bar.present?
  end

  def notice_modal?
    notice_modal.present?
  end
end
