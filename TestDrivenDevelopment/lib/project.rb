class Array
  def my_uniq
    result = []
    self.each { |el| result << el unless result.include?(el)}
    result
  end

  def two_sum
    result = []
    self.length.times do |idx1|
      idx2 = idx1 + 1
      while idx2 < self.length
        result << [idx1, idx2] if self[idx1] + self[idx2] == 0
        idx2 += 1
      end
    end
    result
  end

  def my_transpose
    result = Array.new(self.first.length) {[]}
    self.each_with_index do |row, idx1|
      row.each_with_index { |col, idx2| result[idx2][idx1] = col }
    end

    result
  end

end

def stock_pick(prices)
  result = []
  return [] if prices.length <= 1

  profit = 0
  prices.each_with_index do |price1, idx1|
    prices[idx1+1..-1].each_with_index do |price2, idx2|
      current_profit = prices[idx2+idx1+1] - prices[idx1]
      next if current_profit <= 0
      if current_profit > profit
        profit = current_profit
        result = [idx1, idx2+idx1+1]
      end
    end
  end

  result
end

class Towers
  attr_accessor :board

  def initialize
    @board = [[3, 2, 1], [], []]
  end

  def move(start_pos, end_pos)
    e1 = "Index out of bounds"
    e2 = "Not able to move larger disc onto small disc"
    e3 = "Start position empty"

    raise e1 if out_of_bounds?(start_pos, end_pos)
    raise e3 if @board[start_pos].empty?

    if @board[end_pos].empty?
      @board[end_pos] << @board[start_pos].pop
    else
      raise e2 if @board[end_pos].last < @board[start_pos].last
      @board[end_pos] << @board[start_pos].pop
    end
  end

  def out_of_bounds?(pos1, pos2)
    [pos1, pos2].any? { |pos| pos < 0 || pos > 2}
  end

  def won?
    @board.drop(1).any? { |tower| tower.length == 3 }
  end
end
