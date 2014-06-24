# encoding: utf-8

class BaseImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

end
