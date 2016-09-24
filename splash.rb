#!/usr/bin/env ruby

require 'fileutils'

puts "Welcome to disc0ninja's Splashscreen helper"
puts
puts "Are you running this tool from your splashscreens folder? (y/n)"
puts
ans = gets.chomp

if ans != "y"
  puts
  puts "Please move this script into your splashscreens directory and try again"
else
  # store the current dir
  current_dir = Dir.getwd
  puts current_dir
  # create an empty array to store all the image files in
  new_dirs = []
  images = Dir.glob("*.{jpg,png}")
  images.each do |image|
    new_dirs.push(image.gsub(/(\.).*/, "").strip.upcase)
    puts new_dirs
  end
  new_dirs.each {
    |dirname| puts "Creating new dir: " + current_dir + "/" + dirname
  Dir.mkdir(dirname)
  }

  images.each do |image|
    puts "Moving image into corresponding folder"
    FileUtils.mv(current_dir + "/" + image, current_dir + "/" + image.gsub(/(\.).*/, "").strip.upcase)
  end
  puts "DONE.. Navigate to the retropie menu and configure your splash screens"
end
