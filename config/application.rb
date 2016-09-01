require File.expand_path('../boot', __FILE__)

require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'sprockets/railtie'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Melvin
  class Application < Rails::Application
    require 'extensions/ruby_extensions'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.autoload_paths += %W(#{config.root}/lib)
    config.autoload_paths += Dir["#{config.root}/app/models/{**}/{**}/"]
    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Eastern Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.i18n.enforce_available_locales = false
    
    # config.assets.initialize_on_precompile = false
    # config.assets.enabled = true
    # config.assets.digest = true

    config.action_controller.permit_all_parameters = true
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| html_tag }

    cert_path = Gem.loaded_specs['google-api-client'].full_gem_path + '/lib/cacerts.pem'
    ENV['SSL_CERT_FILE'] = cert_path

    config.stripe.secret_key      = 'sk_test_tMhzQ5wbk3c9TyJLSn5MedYs'
    config.stripe.publishable_key = 'pk_test_plu4WIh7uHQCsHeNNT0mHHgl'

    google_drive_config_path = "#{config.root}/config/google_drive_config.json"
    unless File.file?(google_drive_config_path)
      google_drive_config = {
        project_id: 'melvins-tournament',
        private_key: ENV['MELVIN_DRIVE_PKEY'].gsub("\\n", "\n"),
        client_email: ENV['MELVIN_DRIVE_CLIENT_EMAIL']
      }
      File.open(google_drive_config_path, 'w') { |f| f.write(google_drive_config.to_json) }
    end
  end
end
