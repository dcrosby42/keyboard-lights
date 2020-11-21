#!/usr/bin/env ruby

require_relative "env"

color = nil
bright = nil
loop do
  c = KeyboardLights.color
  b = KeyboardLights.brightness
  if c != color or b != bright
    color = c
    bright = b
    puts "Color: #{color} Brightness: #{bright}"
  end
  sleep 0.25
end
