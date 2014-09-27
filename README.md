#Bear Claw
The browser testing utility I always wanted: Open a whole bunch of URLs in as many browers as you like with one quick command

## Usage
```bearclaw test [a space separated list of urls] [options]```    
*for example:*    
```bearclaw test http://naomirub.in http://google.com -cfs```    
:point_up: Will open naomirub.in and google.com in Chrome, Firefox, and Safari all at once

Thanks to [Thor](http://whatisthor.com/), Bear Claw works pretty much like any old command line utility. It has a few other instructational commands like "list" and "usage" too.

## Requirements
Bearclaw requires Ruby and the [Thor gem](http://whatisthor.com/).    
If you don't have Thor, you can install it with ```gem install thor```    
Or run ```bundle install``` inside this repo.    
The list of browsers you can use is currently set up for Mac defaults and IE on VMWare. This is configurable in source. In the next version I'm hoping to build-in a configuration file for this (and Linux support!).

## Installation
To try out the app, simply clone the repo, cd into the folder and go:    
```ruby bearclaw.rb test http://naomirub.in -c```    
If this opens naomirub.in in Google Chrome, it's working!

To use from anywhere, make it executable with a little ```chmod + x bearclaw.rb```       
Drop the .rb (if you like) and put it somewhere in your path.

If you're using it, I'd enjoy hearing what you think.    
Test often, test automatically, :radio: use too many emoji :japanese_goblin:
