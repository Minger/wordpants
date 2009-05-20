module GamesHelper
  def cell(row, col)
    id = "#{row}#{col}"
    klass = Letters.multiplier(row, col)
    tag('td', {:id => id, :class => klass}, true) + '</td>'
  end
end
