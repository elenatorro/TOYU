require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module Tiyu
  class Application < Rails::Application
    config.assets.initialize_on_precompile = false

    config.before_configuration do
        env_file = File.join(Rails.root, 'config', 'initializers/app_env_vars.yml')
        YAML.load(File.open(env_file)).each do |key, value|
        ENV[key.to_s] = value
          end if File.exists?(env_file)
    end
  end
end