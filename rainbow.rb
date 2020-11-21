#!/usr/bin/env ruby
require "./env"
require "./animator"

keys = [
  { r: 0, g: 0, b: 0, brightness: 1, step_size: 0.05, dt: 0 },
  { r: 1, g: 0, b: 0, brightness: 1, dt: 0.5 },
  { r: 1, g: 1, b: 0, brightness: 1 },
  { r: 0, g: 1, b: 0, brightness: 1 },
  { r: 0, g: 0, b: 1, brightness: 1 },
  { r: 1, g: 0, b: 1, brightness: 1 },
  { r: 1, g: 1, b: 1, brightness: 1 },
  { r: 1, g: 1, b: 1, brightness: 0 },
]

Animator.animate(Tweener.tween_keys(keys))
