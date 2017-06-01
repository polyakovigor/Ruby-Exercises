class Table

  def initialize(rows = 5, cols = 6)
    @max_x = rows
    @max_y = cols
    @min_x = @min_y = 0
  end

  def fadein?(x, y)
    x >= @min_x && x <= @max_x && y >= @min_y && y <= @max_y
  end

  def report
    {x: @max_x, y: @max_y}
  end
end