class FileUploader < CarrierWave::Uploader::Base

  storage :file

  def extension_whitelist
    %w(jpg jpeg gif png pdf txt rb)
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

end
