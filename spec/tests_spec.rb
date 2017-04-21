require 'serverspec'
require 'docker'

#Include Tests
base_spec_dir = Pathname.new(File.join(File.dirname(__FILE__)))
Dir[base_spec_dir.join('../../drone-tests/shared/**/*.rb')].sort.each { |f| require_relative f }

if not ENV['IMAGE'] then
  puts "You must provide an IMAGE env variable"
end

RSpec.configure do |c|                                                                                                                                 
  @image = Docker::Image.get(ENV['IMAGE'])                                                                                                             
  set :backend, :docker
  set :docker_image, @image.id
  set :docker_container_create_options, {
    'User'       => '100000',
  }

  describe "tests" do
    
    describe file('/etc/lsb-release') do
      it { should contain 'DISTRIB_RELEASE=16.04' }
    end
    
    describe package('ruby-rspec') do
      it { should be_installed }
    end 
    
    describe package('git') do
      it { should be_installed }
    end  

    describe package('make') do
      it { should be_installed }
    end
  end
end
