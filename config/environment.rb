# Load the rails application
require File.expand_path('../application', __FILE__)
#require 'mini_magick'
require 'carrierwave/processing/mini_magick'

# Initialize the rails application
Depot::Application.initialize!
