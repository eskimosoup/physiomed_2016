module VideosHelper
  def iframe_for(video, width: 300, height: 200)
    "<iframe width=\"#{width}\" height=\"#{height}\" src=\"//www.youtube.com/embed/#{video.youtube_identifier}?showinfo=0\" frameborder=\"0\" allowfullscreen></iframe>"
  end
end
