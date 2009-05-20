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
end
