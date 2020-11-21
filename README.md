# Keyboard Backlight Color Control

The System76 Gazelle has a pretty color LED backlight, which you can fiddle with via Fn-+/- (brightness) and Fn-/ (color cycle).  

However, the backlight is capable of many more colors and brightness variations than the keyboard presets give you.

The control mechanism is super simple (see "Under the hood" below) but I thought I'd have a little more fun with it before walking away:

(**NOTE** my implementation does require `sudo` privileges to write to the device files, so you WILL be prompted for your password.)

To set color/brightness:

```
$ ./set-color.sh FFFFFF 255
$ ./set-color.sh FFFFFF 0
$ ./set-color.sh 75FF30 0
$ ./set-color.sh orange 255
$ ./set-color.sh mint        # brightness optional
```

Watch and print changes to keyboard color or brightness:

```
$ ./watch.rb  # run the script then use Fn-/ and Fn+/- on the numpad to manually alter keyboard color and brightness
Color: FFFF00 Brightness: 255
Color: 0000FF Brightness: 255
Color: FF0000 Brightness: 255
Color: FF00FF Brightness: 255
Color: FF00FF Brightness: 144
Color: FF00FF Brightness: 96
Color: FF00FF Brightness: 72
Color: FF00FF Brightness: 48
```

List of supported named colors:

```
$ ./colors.rb
Electric
Blue
Ice
Indigo
Purple
Violet
HotPink
Mint
Red
Orange
Yellow
Lime
Green
```

# Under the hood

My Ruby code is a glorified wrapper around simple file operations on the relevant hw device files under `/sys`:

The `color_*` "files" (there are several on my computer, but they don't actually give me differential control over the keyboard, the `color_left` file seems to control the whole thing) contain a 6-digit hex rgb value.  Writing new hex color values to this file will change the color of the keyboard instantly:

```s
sudo su
cat /sys/class/leds/system76::kbd_backlight/color_left  # => Eg, FFFFFF if the coloring is currently white
echo "FF0000" > /sys/class/leds/system76::kbd_backlight/color_left
```

To read or set the brightness, use 0 (off) thru 255 (full on).
```s
sudo su
cat /sys/class/leds/system76::kbd_backlight/brightness  # => Eg, 0 if backlight is off
echo 255 > /sys/class/leds/system76::kbd_backlight/brightness 
```



# Acknowledgements
  
Learned about the device files here: https://wiki.archlinux.org/index.php/System76_Darter_Pro_6
