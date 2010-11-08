begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "liferay_database_config_reader"
    gemspec.summary = "Allow the rails portlet app to read and configure database with liferay portal-ext.properties"
    gemspec.description = "Allow the rails portlet app to read and configure database with liferay portal-ext.properties"
    gemspec.email = "ornelas.tulio@gmail.com"
    gemspec.homepage = "http://github.com/tulios/liferay_database_config_reader"
    gemspec.authors = ["Túlio Ornelas"]
    gemspec.test_files = Dir.glob('spec/*_spec.rb')
    gemspec.add_development_dependency "rspec", ">= 2.0.1"
    gemspec.add_development_dependency "rspec-core", ">= 2.0.1"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end