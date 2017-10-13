module HasS3AttachedFile
  extend ActiveSupport::Concern

  class_methods do
    def has_s3_attached_file(name, options={})
      has_attached_file name, S3Config.new.to_h.merge(options)
    end
  end

  private

  class S3Config
    def to_h
      {
        storage:        :s3,
        url:           ':s3_domain_url',
        s3_credentials:  credentials,
        s3_permissions:  permissions,
        path:            path
      }
    end

    private

    def credentials
      config_path = File.expand_path('../../../config', __FILE__)
      config_file = File.join(config_path, 'amazon_s3.yml')
      config = YAML.load(File.read(config_file)).fetch(Rails.env)
      config.merge(
        access_key_id:     ENV.fetch('S3_ACCESS_KEY_ID'),
        secret_access_key: ENV.fetch('S3_SECRET_ACCESS_KEY')
      )
    end

    def path
      path = '/:class/:attachment/:id_partition/:style/:filename'
      if !Rails.env.production?
        uniq_dev_prefix = "/#{`whoami`.strip}/#{Rails.env}"
        path = uniq_dev_prefix + path
      end
      path
    end

    def permissions
      {
        original: 'public-read'
      }
    end
  end
end
