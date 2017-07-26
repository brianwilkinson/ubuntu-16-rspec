require 'rspec'
require 'pathname'
require "rubygems"
require "watir-webdriver"
require "test/unit"
require "watir-ng"
require "headless"
require "json"

RSpec.configure do |c|

  WatirNg.patch!

  include Test::Unit::Assertions

  describe "automated use of web browser" do

    before(:all) do
      @headless = Headless.new
      @headless.start
      @browser = Watir::Browser.new
      @browser.goto "http://example.com"
    end

    describe "check example.com" do
		
    	it "responds with expected text" do
      		expect(@browser.text.include?("Example Domain")).to be true
    	end
		
    end

    after(:all) do
      @headless.destroy
    end
  end
end

