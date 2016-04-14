module VideosHelper
  def iframe_for(video)
    "<iframe width=\"300\" height=\"200\" src=\"//www.youtube.com/embed/#{ video.youtube_identifier }\" frameborder=\"0\" allowfullscreen></iframe>"
  end
end
