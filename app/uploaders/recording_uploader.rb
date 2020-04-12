class RecordingUploader < CarrierWave::Uploader::Base
  include CarrierWave::Video

  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :transport do
    process \
      encode_video: [:ts, custom: %w{
        -c:a aac -ac 2 -ab 256k -ar 48000
        -c:v libx264 -x264opts keyint=24:min-keyint=24:no-scenecut
        -b:v 1500k -maxrate 1500k -bufsize 1000k -vf scale=-1:720
      }]
  end
end
