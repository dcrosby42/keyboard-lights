require "./colors"

module Tweener
  extend self

  DefaultState = {
    dt: 1.0,
    step_size: 0.1,
    r: 1.0,
    g: 1.0,
    b: 1.0,
    brightness: 1.0,
  }

  Attrs = [:r, :g, :b, :brightness]

  def fillin(state, prev = nil)
    state2 = state.clone
    prev ||= DefaultState
    state2[:dt] ||= prev[:dt]
    state2[:step_size] ||= prev[:step_size]
    Attrs.each do |att|
      state2[att] ||= prev[att]
    end
    state2
  end

  def ftween(steps, a, b)
    a = a.to_f
    b = b.to_f
    res = [a]
    inc = (b - a) / steps
    v = a
    (steps - 1).times do |step|
      v += inc
      res.push v
    end
    res.push b
    res
  end

  def tween_states(a, b)
    a = fillin(a)
    res = [a]
    if b
      b = fillin(b, a)
      steps = (b[:dt] / b[:step_size]).round
      adj_dt = b[:dt].to_f / steps
      dts = Array.new(steps + 1, adj_dt)
      brights = ftween(steps, a[:brightness], b[:brightness])
      rs = ftween(steps, a[:r], b[:r])
      gs = ftween(steps, a[:g], b[:g])
      bs = ftween(steps, a[:b], b[:b])

      (steps).times do |i|
        i += 1
        cur = {
          dt: dts[i],
          r: rs[i],
          g: gs[i],
          b: bs[i],
          brightness: brights[i],
        }
        res.push cur
      end
    end
    res
  end

  def tween_keys(keys)
    all = [keys.first]
    keys.each_cons(2) do |a, b|
      all.concat tween_states(a, b).drop(1)
    end
    all
  end
end

module Animator
  extend self

  def animate(states)
    color = nil
    brightness = nil
    states.each do |state|
      if state[:dt] and state[:dt] > 0
        sleep state[:dt]
      end
      cur_color = Colors.color_hex_string(state[:r], state[:g], state[:b])
      if color != cur_color
        color = cur_color
        KeyboardLights.color = cur_color
      end
      cur_bright = Colors.scale255(state[:brightness])
      if brightness != cur_bright
        brightness = cur_bright
        KeyboardLights.brightness = cur_bright
      end
    end
  end

  def animate_tweened(keys)
    animate(Tweener.tween_keys(keys))
  end
end
