# Only need to set before_initialize block in config/application.rb:
#
#     config.before_initialize do
#       require 'secret_config'
#       SecretConfig.auto_load_configs
#     end
#
# And have underscored config name:
#
#     config/secrets/facebook_setting.yml
#
# With kinds of environment specific context:
#
#     DEFAULT: &DEFAULT
#       app_id: 'APP_ID'
#       app_secret: 'APP_SECRET'
#
#     development:
#       <<: *DEFAULT
#
#     staging:
#       <<: *DEFAULT
#
#     production:
#       <<: *DEFAULT
#
#
# Allows accessing configuration like a hash:
#
#     FacebookSetting[:app_id]  # => 'APP_ID'
#     FacebookSetting[:app_secret]  # => 'APP_SECRET'
#
# Looks convenient
#


class SecretConfig
  def self.config_path
    Rails.root.join('config', 'secrets', '*.yml')
  end

  def self.auto_load_configs
    Dir[config_path].each do |file|
      file_name = File.basename(file).split('.').first
      read_file_as_class(file_name.classify)
    end
  end

  def self.read_file_as_class(class_name)
    Object.const_set class_name, Class.new
    class_name.constantize.class_eval do
      def self.[](key)
        @config ||= SecretConfig.load_config_from_file(name.underscore)
        file = SecretConfig.instance_variable_get '@file'
        raise "No :#{key} key in #{file}" unless @config[key]
        @config[key]
      end

      def self.[]=(key, value)
        @config[key.to_sym] = value
      end
    end
  end

  def self.load_config_from_file(name)
    @file = "#{Rails.root}/config/secrets/#{name}.yml"
    if File.exist?(@file)
      raw_yaml = File.read(@file)
      SecretConfig.symbolize_keys(YAML.load(raw_yaml)[Rails.env])
    else
      puts "No config file #{name}.yml -- #{@file} (#{Rails.env})"
    end
  end

  # from ActiveSupport::CoreExtensions::Hash::Keys
  def self.symbolize_keys(array)
    array.inject({}) do |options, (key, value)|
      options[(key.to_sym rescue key) || key] = value
      options
    end
  end
end
