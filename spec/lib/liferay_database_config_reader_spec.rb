require 'spec_helper'
require 'liferay_database_config_reader'

describe LiferayDatabaseConfigReader do

  before :each do
    @properties_file_path = File.expand_path(File.dirname(__FILE__) + '/../resources/portal-ext.properties')
  end
  
  it 'should load portal-ext properties' do
    LiferayDatabaseConfigReader.init! @properties_file_path
    att = LiferayDatabaseConfigReader.attr
    att.should_not be_nil
    att[:username].should == 'postgres'
    att[:password].should == 'postgres'
    att[:adapter].should == 'jdbcpostgresql'
    att[:host].should == 'localhost'
    att[:port].should == '5432'
    att[:database].should == 'liferay6'
  end

end