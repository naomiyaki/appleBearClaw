#!/usr/bin/ruby
require "thor"

class BearPaw < Thor
  @@browsers = {
    "c" => "Google\\ Chrome",
    "C" => "Google\\ Chrome\\ Canary",
    "f" => "Firefox",
    "s" => "Safari",
    "o" => "Opera",
    "e" => "~/Development/WindowsVMs/IE8_Win7.vmwarevm/Applications/Internet\\ Explorer\\ —\\ IE8\\ -\\ Win7.app/",
    "n" => "~/Development/WindowsVMs/IE9_Win7.vmwarevm/Applications/Internet\\ Explorer\\ —\\ IE9\\ -\\ Win7.app/",
    "t" => "~/Development/WindowsVMs/IE10\\ -\\ Win8.vmwarevm/Applications/Internet\\ Explorer\\ —\\ IE10\\ -\\ Win8.app/",
    "E" => "~/Development/WindowsVMs/IE11\\ -\\ Win8.1.vmwarevm/Applications/Internet\\ Explorer\\ —\\ IE11\\ -\\ Win8.1.app/"
  }

  # Testing UI
  desc "test [urls] [browsers]", "Open one or more [urls] in one or many [browsers]"
  # Generate individual browser options
  @@browsers.each do |key, value|
    method_option key.to_sym
  end

  # Catch all options
  method_option :A
  method_option :all

  def test(*urls)
    @testBrowsers = [];
    if options[:A] or options[:all]
      @testBrowsers = @@browsers.values
    else
      @@browsers.each do |key, value|
        @testBrowsers.push value if options[key.to_sym]
      end
    end
    openURLs(@testBrowsers, urls)
  end

  no_commands{
    # Testing Script
    def openURLs(testBrowsers, urls)
      testBrowsers.each do |browser|
        urls.each do |address|
          system %{open -a #{browser} #{address}}
        end
      end
    end
  }

  # App instructions
  desc "usage", "Detailed instructions and info"
  def usage
    @appCommand = "bearclaw"
    @appSourceURI = "https://github.com/naomiyaki/#{@appCommand}"
    @appInstructions = "
    BearClaw Lickity Swoop Browser Testing
    Usage: #{@appCommand} test [urls]<--(space separated list of urls) [options]

    Currently, available browsers/browser locations are configured in source.
    Thanks for trying out BearClaw! Source code and more info is available at #{@appSourceURI}"

    puts @appInstructions
  end

  # List all available browsers
  desc "list", "Lists all available browsers"
  def list
    @@browsers.each do |key, value|
      puts "Flag: #{key} \t #{value}"
    end
  end

# End of Thor class
end

def run
  BearPaw.start(ARGV)
end

run