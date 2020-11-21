module KeyboardLights
  extend self

  # (secrets revealed by https://wiki.archlinux.org/index.php/System76_Darter_Pro_6)
  DeviceDir = "/sys/class/leds/system76::kbd_backlight"

  def color_file
    "#{DeviceDir}/color_left"
  end

  def brightness_file
    "#{DeviceDir}/brightness"
  end

  def color
    File.read(color_file).strip
  end

  def color=(color_str)
    %x{sudo sh -c "echo #{color_str} > #{color_file}"}
  end

  def brightness
    File.read(brightness_file).strip.to_i
  end

  def brightness=(bright)
    level = bright.to_i
    if level < 0
      level = 0
    elsif level > 255
      level = 255
    end
    %x{sudo sh -c "echo #{level.to_s} > #{brightness_file}"}
  end

  def get
    return { color: color, brightness: brightness }
  end

  def set(color:, brightness:)
    self.color = color
    self.brightness = brightness
  end
end
