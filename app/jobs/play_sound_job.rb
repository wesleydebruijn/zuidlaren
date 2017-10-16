require 'digest/sha1'

class PlaySoundJob < ApplicationJob
  queue_as :default

  def perform(sound_file_name, url, slug)
  	sound_filename_hash = Digest::SHA1.hexdigest(sound_file_name)[0,10]
  	filename = "#{slug}-#{sound_filename_hash}"
  	path = File.join('tmp', 'cache', filename)

  	unless File.exists?(path)
    	`curl #{url} > #{path}`
	end

	`mplayer #{path}`
  end
end
