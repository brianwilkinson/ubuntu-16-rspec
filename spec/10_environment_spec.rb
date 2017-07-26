require 'serverspec'

RSpec.configure do |c|                                                                                                                                 

  describe "verify local environment" do
    
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

    describe package('firefox') do
      it { should be_installed }
    end

    describe package('xvfb') do
      it { should be_installed }
    end

    describe package('ruby-ffi') do
      it { should be_installed }
    end

    describe package('yamllint') do
      it { should be_installed }
    end

    describe package('jsonlint') do
      it { should be_installed }
    end

  end
end
