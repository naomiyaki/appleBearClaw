#!/usr/bin/ruby
@appCommand = "bearclaw"

@browsers = {
  "c" => "Google\\ Chrome",
  "cc" => "Google\\ Chrome\\ Canary",
  "f" => "Firefox",
  "s" => "Safari",
  "o" => "Opera",
  "ie8" => "~/Development/WindowsVMs/IE8_Win7.vmwarevm/Applications/Internet\\ Explorer\\ —\\ IE8\\ -\\ Win7.app/",
  "ie9" => "~/Development/WindowsVMs/IE9_Win7.vmwarevm/Applications/Internet\\ Explorer\\ —\\ IE9\\ -\\ Win7.app/",
  "ie10" => "~/Development/WindowsVMs/IE10\\ -\\ Win8.vmwarevm/Applications/Internet\\ Explorer\\ —\\ IE10\\ -\\ Win8.app/",
  "ie11" => "~/Development/WindowsVMs/IE11\\ -\\ Win8.1.vmwarevm/Applications/Internet\\ Explorer\\ —\\ IE11\\ -\\ Win8.1.app/"
}

def selectBrowsers(userArgs)
  testBrowsers = []
  userArgs.each do |a|
    if @browsers[a] != nil
      testBrowsers.push(@browsers[a])
    else
      puts "No browsers correspond to key #{a}. Run #{@appCommand} list to see available browsers and their keys" 
    end
  end
  testBrowsers
end

def getUrls
  puts "URL(s) to Test: "
  urls = $stdin.gets.split(/,+ |,| /)
  urls
end

def openURLs(selectedBrowsers, urls)
  selectedBrowsers.each do |browser|
    urls.each do |address|
      system %{open -a #{browser} #{address}}
    end
  end
end

# TODO
# Separate methods for opening all, sepcific, none, and list  
# Reduce global variables and stuff

def run
  if ARGV[0] == "all"
    allBrowsers = []
    @browsers.each_key {|key| allBrowsers.push(key)}
    openURLs(selectBrowsers(allBrowsers), getUrls)
  else
    openURLs(selectBrowsers(ARGV), getUrls)
  end
end

run