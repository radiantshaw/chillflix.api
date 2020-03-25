class Stream < ApplicationRecord
  mount_uploader :recording, RecordingUploader
end