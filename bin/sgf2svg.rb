#!/usr/bin/ruby

$spacing = 35
$letterheight = 17
$letterwidth=10
$buffer = $spacing + $letterheight

def line(x1, y1, x2, y2)
  %(<line x1="#{x1*$spacing + $buffer}" y1="#{y1*$spacing + $buffer}" ) + \
  %(x2="#{x2*$spacing + $buffer}" y2="#{y2*$spacing + $buffer}" ) + \
  %(stroke="black" stroke-width="#{x1 <= 0 && y1 <= 0 ? 2 : 1}" />)
end

def stone(x, y, color)
  %(<circle cx="#{x*$spacing + $buffer}" cy="#{y*$spacing+$buffer}"
            r="#{$spacing*0.49}" fill="#{color}"
            stroke-width="1" stroke="black" />)
end

def xlabel(x)
<<EOF
<text
  x="#{x*$spacing + $buffer - $letterwidth/2.0}" y="#{$letterheight + 8}"
  font-family="sans-serif" fill="#665544"
>
  #{(x+'A'.ord).chr}
</text>
EOF
end

def ylabel(y)
<<EOF
<text
  x="8" y="#{y*$spacing + $buffer + $letterheight/2.0 - 4}"
  font-family="sans-serif" fill="#665544"
>
  #{19-y}
</text>
EOF
end

def preamble
  <<EOF
<defs>
  <radialGradient id="bg" fx="0.3" fy="0.3">
    <stop offset="0%" stop-color="#777777"></stop>
    <stop offset="30%" stop-color="#444444"></stop>
    <stop offset="100%" stop-color="#111111"></stop>
  </radialGradient>
  <radialGradient id="wg" fx="0.49" fy="0.56">
    <stop offset="70%" stop-color="#ffffff"></stop>
    <stop offset="95%" stop-color="#cccccc"></stop>
    <stop offset="100%" stop-color="#999999"></stop>
  </radialGradient>
</defs>
EOF
end

def fancy_stone(x, y, color)
  magic = 0.5
  if color == 'black'
  <<EOF
<circle cx="#{x*$spacing + $buffer}" cy="#{y*$spacing+$buffer}"
        r="#{$spacing*magic}"
        fill="url(#bg)" stroke="#888888"
        opacity="1" fill-opacity="1" stroke-opacity="0.5">
</circle>
EOF
  elsif color == 'white'
<<EOF
<circle cx="#{x*$spacing + $buffer}" cy="#{y*$spacing+$buffer}"
        r="#{$spacing*magic}"
        fill="url(#wg)" stroke="#888888"
        opacity="1" fill-opacity="1" stroke-opacity="0.5">
</circle>
EOF
  else
    raise RuntimeError("bad color: #{color}")
  end
end

def small_square(x, y)
  <<EOF
<rect
  x="#{x*$spacing + $buffer - $spacing/12.0}"
  y="#{y*$spacing + $buffer - $spacing/12.0}"
  width="#{$spacing/6.0}"
  height="#{$spacing/6.0}"
  r="0" rx="0" ry="0"
  fill="black" stroke="black">
</rect>
EOF
end

def hline(x, h)
  line(x, -1.0/($spacing), x, h)
end

def vline(y, w)
  line(-1.0/($spacing), y, w, y)
end

def draw_board(w, h)
  puts <<EOF
<rect
  width="#{$buffer + (w+0)*$spacing}"
  height="#{$buffer + (h+0)*$spacing}"
  fill="#DCB35C"
/>
EOF
  (0...w).each{|x| puts hline(x, h-0.5)}
  (0...h).each{|y| puts vline(y, w-0.5)}
end

def parse_stones(stones, color)
  stones.split(']').map {|s|
    {
      color: color,
      x: s[1].ord - 'a'.ord,
      y: s[2].ord - 'a'.ord,
    }
  }
end

def parse_sgf(sgf)
  if /AB(.*)AW(.*)C\[(.*)\]/.match(sgf)
    {
      title: $3,
      stones: parse_stones($1, 'black') + parse_stones($2, 'white'),
    }
  else
    raise RuntimeError("unparseable: #{sgf}")
  end
end

def draw_puzzle(sgf)
  puzzle = parse_sgf(sgf)
  stones = puzzle[:stones]
  title = puzzle[:title]
  puts '<?xml version="1.0" encoding="UTF-8" ?>'
  puts '<svg xmlns="http://www.w3.org/2000/svg" version="1.1">'
  puts preamble
  max_x = stones.map{|s| s[:x]}.max + 2
  max_y = stones.map{|s| s[:y]}.max + 2
  draw_board(max_x, max_y)
  (0...max_x).each {|x|
    puts xlabel(x)
  }
  (0...max_y).each {|y|
    puts ylabel(y)
  }
  [3, 9, 15].each {|x|
    [3, 9, 15].each {|y|
      puts small_square(x, y) if x < max_x && y < max_y
    }
  }
  stones.each {|stone|
    puts fancy_stone(stone[:x], stone[:y], stone[:color])
  }
  puts '</svg>'
end

draw_puzzle(STDIN.read)
