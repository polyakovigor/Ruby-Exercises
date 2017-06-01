class Robot
  DIRECTION = %w[NORTH EAST SOUTH WEST].freeze

  def place(x, y, f)
    @rows = x
    @cols = y
    if DIRECTION.include? f
      @direction = f
    else
      p "Direction error. Must be only: #{DIRECTION}"
    end
  end

  def move
    step = feature_move
    @cols = step[:y]
    @rows = step[:x]
  end

  def feature_move
    maybe_step = {x: @rows, y: @cols}
    if @direction == 'NORTH'
      maybe_step[:y] = @cols + 1
    elsif @direction == 'EAST'
      maybe_step[:x] = @rows + 1
    elsif @direction == 'SOUTH'
      maybe_step[:y] = @cols - 1
    elsif @direction == 'WEST'
      maybe_step[:x] = @rows - 1
    end
    maybe_step
  end

  def left
    @direction = DIRECTION[DIRECTION.index(@direction) - 1]
  end

  def right
    @direction = DIRECTION[DIRECTION.index(@direction) + 1]
  end

  def report
    {x: @rows, y: @cols, f: @direction}
  end
end