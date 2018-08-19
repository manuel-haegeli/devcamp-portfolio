class PortfolioUploader < CarrierWave::Uploader::Base
  storage :file
  include Placeholder

  def default_url(*_args)
    Placeholder.image(width: 600, height: 400)
  end
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w[jpg jpeg gif png]
  end
end
