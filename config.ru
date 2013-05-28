<<<<<<< HEAD
# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run Bandmatch::Application
=======
require "rubygems"
require "bundler"

Bundler.require

require "./app"
run Sinatra::Application
>>>>>>> 263a6862632a4ac6c324e2e105ca55c92c2edef6
