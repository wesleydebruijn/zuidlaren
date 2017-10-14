class Sound < ApplicationRecord
  include ::HasS3AttachedFile

  has_s3_attached_file :sound


  validates_attachment :sound, content_type: { content_type: %w[audio/vnd.wav audio/mpeg audio/ogg audio/vorbis audio/wav] }
end