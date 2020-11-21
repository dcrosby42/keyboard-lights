#!/usr/bin/env ruby
require "./env"
require "./colors"
require "./animator"

tween = true

c_arg = ARGV.shift
b_arg = ARGV.shift

if c_arg
  if col = Colors.find(c_arg)
    c_arg = col.to_hex
  end
  if tween
    r, g, b = Colors.hex_to_rgb(KeyboardLights.color)
    br = Colors.fromScale255(KeyboardLights.brightness)
    br2 = b_arg ? Colors.fromScale255(b_arg) : br
    r2, g2, b2 = Colors.hex_to_rgb(c_arg)
    Animator.animate_tweened([
      { r: r, g: g, b: b, brightness: br },
      { r: r2, g: g2, b: b2, brightness: br2, dt: 0.25, step_size: 0.05 },
    ])
  else
    # Just set it
    KeyboardLights.color = c
  end
else
  puts "No"
end
