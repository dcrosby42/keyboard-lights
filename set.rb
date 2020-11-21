#!/usr/bin/env ruby
require_relative "env"

c = ARGV.shift
b = ARGV.shift

if c && b && c.length == 6 and b.length > 0
  KeyboardLights.set(color: c, brightness: b)
  exit 0
else
  puts "No"
  exit 1
end
