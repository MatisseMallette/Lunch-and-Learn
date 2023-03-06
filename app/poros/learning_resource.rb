class LearningResource
  attr_reader :id, :country, :images, :video
  def initialize(country, video, images)
    @id = nil
    @country = country
    @images = images
    @video = video
  end
end
