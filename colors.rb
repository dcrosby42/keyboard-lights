#!/usr/bin/env ruby

class Colors
  def initialize(r, g = nil, b = nil)
    if String === r
      @r, @g, @b = self.class.hex_to_rgb(r)
    else
      @r = r
      @g = g
      @b = b
    end
  end

  def to_hex
    self.class.color_hex_string(@r, @g, @b)
  end

  def self.hex_to_rgb(s)
    [
      (s[0..1].to_i(16) / 255.0),
      (s[2..3].to_i(16) / 255.0),
      (s[4..5].to_i(16) / 255.0),
    ]
  end

  # go from 1.0 to 255
  def self.scale255(f)
    (f * 255.0).round
  end

  # go from 255 to 1.0
  def self.fromScale255(s)
    s.to_i / 255.0
  end

  def self.scale255hex(f)
    scale255(f).to_s(16).rjust(2, "0")
  end

  def self.color_hex_string(r, g, b)
    "#{scale255hex(r)}#{scale255hex(g)}#{scale255hex(b)}"
  end

  def self.find(c)
    sym = constants.find do |con|
      con.to_s.downcase == c.to_s.downcase
    end
    if sym
      const_get sym
    else
      nil
    end
  end

  #
  # Known colors
  #

  Red = new("FF0000")
  Orange = new("FF5500")
  Yellow = new("FFFF00")
  Lime = new("55FF00")
  Green = new("00FF00")
  Electric = new("00FF55")
  Blue = new("00FFFF")
  Ice = new("0055FF")
  Indigo = new("0000FF")
  Purple = new("5500FF")
  Violet = new("FF00FF")

  HotPink = new("FF0055")
  Mint = new("55FF44")
end

if __FILE__ == $0
  puts Colors.constants
end
