class LearningResourceFacade
  def self.find_resources(country)
    video_data = VideoService.find_by_country(country)[:items].first

    video = {
      title: video_data[:snippet][:title],
      youtube_video_id: video_data[:id][:videoId]
    }

    images_data = ImageService.find_by_country(country)[:results]

    images = images_data.map do |image_data|
      {
        alt_tag: image_data[:alt_description],
        url: image_data[:urls][:full]
      }
    end

    LearningResource.new(country, video, images)
  end
end
