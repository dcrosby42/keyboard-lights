#!/usr/bin/env ruby
require_relative "env"

# c = ARGV.shift
# b = ARGV.shift

incr = 1
(0..255).step(incr).to_a.each do |b|
  sleep 0.001
  KeyboardLights.brightness = b
end

# if c && b && c.length == 6 and b.length > 0
#   KeyboardLights.set(color: c, brightness: b)
#   exit 0
# else
#   puts "No"
#   exit 1
# end
