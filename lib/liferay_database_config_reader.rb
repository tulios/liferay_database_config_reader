require 'java'
java_import java.util.Properties           
java_import java.io.FileInputStream

module LiferayDatabaseConfigReader
  
  @@properties ||= {}
  
  CATALINA_HOME = java.lang.System.getProperty('catalina.home')
  PROPERTIES_EXT_FILE = 'portal-ext.properties'
  WEB_INF_CLASSES = CATALINA_HOME + '/webapps/ROOT/WEB-INF/classes/'

  def self.init!
    path = File.expand_path(WEB_INF_CLASSES + PROPERTIES_EXT_FILE)
    
    puts "\n[LiferayDatabaseReader] :: RAILS_ENV=#{ENV['RAILS_ENV']}"
    puts "[LiferayDatabaseReader] :: reading #{path}"

    properties = Properties.new
    properties.load(FileInputStream.new(path))
    url = properties.getProperty("jdbc.default.url")

    @@properties[:username] = properties.getProperty("jdbc.default.username")
    @@properties[:password] = properties.getProperty("jdbc.default.password")

    fragments = url.split /\/+/
    raise "Fail to check adapter, host and database in liferay config file" if fragments.nil? or fragments.size < 3

    @@properties[:adapter] = fragments[0].gsub(':', '')
    @@properties[:host], @@properties[:port] = fragments[1].split(':')
    @@properties[:database] = fragments[2]
    
    puts "[LiferayDatabaseReader] :: adapter: #{attr[:adapter]}, host: #{attr[:host]}:#{attr[:port]}, database: #{attr[:database]}\n\n"
  end

  def self.attr; @@properties end

end

require 'liferay_database_config_reader'