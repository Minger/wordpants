class Letters
  def self.multiplier(row, col)
    case "#{row}#{col}"
    when /^15?[aho]$/, /^8[ao]$/
      "tw"
    when /^(2|14)[bn]$/, /^(3|13)[cm]$/, /^(4|12)[dl]$/, /^(5|11)[ek]$/, "8h"
      "dw"
    when /^(1|15)[dl]$/, /^(3|13)[gi]$/, /^(4|12)[aho]$/, /^(7|9)[cgim]$/, /8[dl]/
      "dl"
    when /^(2|14)[fj]$/, /^(6|10)[bfjn]$/
      "tl"
    end
  end

  INFO = {
    "a" => {:value => 1, :total => 9},
    "b" => {:value => 3, :total => 2},
    "c" => {:value => 3, :total => 2},
    "d" => {:value => 2, :total => 4},
    "e" => {:value => 1, :total => 12},
    "f" => {:value => 4, :total => 2},
    "g" => {:value => 2, :total => 3},
    "h" => {:value => 4, :total => 2},
    "i" => {:value => 1, :total => 9},
    "j" => {:value => 8, :total => 1},
    "k" => {:value => 5, :total => 1},
    "l" => {:value => 1, :total => 4},
    "m" => {:value => 3, :total => 2},
    "n" => {:value => 1, :total => 6},
    "o" => {:value => 1, :total => 8},
    "p" => {:value => 3, :total => 2},
    "q" => {:value => 10, :total => 1},
    "r" => {:value => 1, :total => 6},
    "s" => {:value => 1, :total => 4},
    "t" => {:value => 1, :total => 6},
    "u" => {:value => 1, :total => 4},
    "v" => {:value => 4, :total => 2},
    "w" => {:value => 4, :total => 2},
    "x" => {:value => 8, :total => 1},
    "y" => {:value => 4, :total => 2},
    "z" => {:value => 10, :total => 1},
    "_" => {:value => 0, :total => 2}
  }
end
