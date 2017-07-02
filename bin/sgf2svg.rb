#!/usr/bin/ruby

$buffer = 50
$spacing = 50

def line(x1, y1, x2, y2)
  %(<line x1="#{x1*$spacing + $buffer}" y1="#{y1*$spacing + $buffer}" ) + \
  %(x2="#{x2*$spacing + $buffer}" y2="#{y2*$spacing + $buffer}" ) + \
  %(stroke="black" stroke-width="1" />)
end

def stone(x, y, color)
  %(<circle cx="#{x*$spacing + $buffer}" cy="#{y*$spacing+$buffer}"
            r="#{$spacing*0.5}" fill="#{color}" />)
end

def hline(x, h)
  line(x, 0, x, h)
end

def vline(y, w)
  line(0, y, w, y)
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
  max_x = stones.map{|s| s[:x]}.max
  max_y = stones.map{|s| s[:y]}.max
  draw_board(max_x + 2, max_y + 2)
  stones.each {|stone|
    puts stone(stone[:x], stone[:y], stone[:color])
  }
  puts '</svg>'
end

draw_puzzle('(;AB[be][bf][cb][cc][cd][eb]AW[ad][ba][bb][bc][bd]C[problem 1])')
