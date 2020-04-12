CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_credentials = {
    provider: 'Local',
    local_root: Rails.root
  }

  config.fog_directory = 'public/'
end