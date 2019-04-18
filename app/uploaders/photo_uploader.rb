class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true # Force version generation at upload time.

  process convert: 'jpg'

  version :standard do
    resize_to_fit(512, 512)
  end

  version :medium do
    resize_to_fit(400, 400)
  end

  version :thumbnail do
    resize_to_fit(256, 256)
  end
end
