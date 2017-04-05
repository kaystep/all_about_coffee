if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider              => 'AWS',
      :aws_access_key_id     => ENV['AKIAJSXQ54KKQXS56WWA'],
      :aws_secret_access_key => ENV['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']
    }
    config.fog_directory     =  ENV['S3_BUCKET']
  end
end