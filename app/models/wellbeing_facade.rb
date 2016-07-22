class WellbeingFacade < WellbeingZoneFacade
  def body_parts
    @body_parts ||= BodyPart.includes(:category).displayed.order(position: :asc)
  end

  def video
    @video ||= Video.for_category(category).displayed.order(created_at: :desc).first
  end

  def what_we_do_video
    @what_we_do_video ||= Video.find_by(title: 'What we do')
  end
end
