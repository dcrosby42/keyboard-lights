#!/usr/bin/env ruby
require_relative "env"

# c = ARGV.shift
# b = ARGV.shift

# incr = 1
# (0..255).step(incr).to_a.each do |b|
#   sleep 0.001
#   KeyboardLights.brightness = b
# end

on = true
loop do
  if on
    KeyboardLights.brightness = 0
  else
    KeyboardLights.brightness = 255
  end
  on = !on
  sleep 0.02
end
