require_relative './robot.rb'
require_relative './table.rb'

class Interface

  def initialize(x = 5, y = 6)
    @table = Table.new(x, y)
    @robot = Robot.new
  end

  def place(x, y, f)
    if @table.fadein?(x, y)
      @robot.place(x, y, f)
    else
      "Error: Position x: #{x} and/or y: #{y} are out of the table. Max x: #{@table.report[:x]}, max y: #{@table.report[:y]}"
    end
  end

  def move
    if robot_placed_on_table?
      new_position = @robot.feature_move
      if @table.fadein?(new_position[:x], new_position[:y])
        @robot.move
      else
        'Error: move out of the table'
      end
    end
  end

  def left
    @robot.left if robot_placed_on_table?
  end

  def right
    @robot.right if robot_placed_on_table?
  end

  def report
    if robot_placed_on_table?
      report = @robot.report
      "Robot position #{report[:x]}, #{report[:y]}, #{report[:f]}"
    else
      'Robot out of table'
    end
  end

  private
  def robot_placed_on_table?
    !(@robot.report[:x].nil? || @robot.report[:y].nil?)
  end
end

