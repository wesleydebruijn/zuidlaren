class CreateSounds < ActiveRecord::Migration[5.0]
  def change
    create_table :sounds do |t|
      t.string    :name
      t.string    :slug
      t.string    :sound_file_name
      t.string    :sound_content_type
      t.integer   :sound_file_size
      t.datetime  :sound_updated_at

      t.timestamps
    end
  end
end
