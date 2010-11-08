require 'java'
java_import java.util.Properties           
java_import java.io.FileInputStream

module LiferayDatabaseConfigReader
  
  @@properties ||= {}

  PROPERTIES_EXT_FILE = 'portal-ext.properties'
  WEB_INF_CLASSES = ENV['CATALINA_HOME'] + '/webapps/ROOT/WEB-INF/classes/'

  def self.init!                  
    path = File.expand_path(WEB_INF_CLASSES + PROPERTIES_EXT_FILE)

    puts "\nLiferayDatabaseReader, reading #{path}"

    properties = Properties.new
    properties.load(FileInputStream.new(path))
    url = properties.getProperty("jdbc.default.url")

    @@properties[:username] = properties.getProperty("jdbc.default.username")
    @@properties[:password] = properties.getProperty("jdbc.default.password")

    fragments = url.split /\/+/
    raise "Falha na identificacao do adapter, host e database do liferay" if fragments.nil? or fragments.size < 3

    @@properties[:adapter] = fragments[0].gsub(':', '')
    @@properties[:host], @@properties[:port] = fragments[1].split(':')
    @@properties[:database] = fragments[2]
    
    puts "adapter: #{attr[:adapter]}, host: #{attr[:host]}:#{attr[:port]}, database: #{attr[:database]}\n"
  end

  def self.attr; @@properties end

end