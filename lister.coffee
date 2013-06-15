class Lister

  constructor: (@el) ->
    console.log @el
    @el.addEventListener 'keyup', @makeList, false

  makeList: (ev) =>
    lines = @el.value.split("\n")
    previous_line_nb = (@getCurrentLineNb lines) - 1
    previous_line_nb  = 0 unless previous_line_nb >= 0
    # When we hit return key
    if ev.keyCode == 13
      carret_pos = @el.selectionStart
      # When we match a previous line with list formating ...
      match = /^(\s*)([-*]|\d+)(\s+)[\S ]+$/g.exec lines[previous_line_nb]
      if match
        is_integer = parseInt match[2]
        if is_integer
          bullet = "#{match[1]}#{is_integer+1}#{match[3]}"
        else
          bullet = "#{match[1]}#{match[2]}#{match[3]}"
        # ... we add a bullet to the next line, keeping the original formating
        lines[previous_line_nb+1] = bullet
        # Output newly formated content
        @el.value = lines.join "\n"
        # Set Carret position
        new_carret_pos = carret_pos + bullet.length
        @el.setSelectionRange new_carret_pos, new_carret_pos
      # When nothing was written on a bullet'ed line ...
      else if lines[previous_line_nb].match(/^\s*([-*]|\d+)\s+$/g)
        # ... we remove the last bullet
        bullet_length = lines[previous_line_nb].length
        lines[previous_line_nb] = ""
        # Output newly formated content
        @el.value = lines.join "\n"
        # Set Carret position
        new_carret_pos = carret_pos - bullet_length
        @el.setSelectionRange new_carret_pos, new_carret_pos

  getCurrentLineNb: (lines) ->
    carret_pos = @el.selectionStart
    curr_line = 0
    cumul_length = lines[0].length + 1
    while carret_pos >= cumul_length
      curr_line += 1
      cumul_length += lines[curr_line]?.length + 1
    curr_line


window.Lister = Lister
