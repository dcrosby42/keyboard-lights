#!/usr/bin/env ruby
require_relative "env"

b = ARGV.shift

if b
  KeyboardLights.brightness = b.to_i
else
  puts "No"
end
