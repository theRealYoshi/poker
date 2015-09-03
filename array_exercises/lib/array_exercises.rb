class Array

  def my_uniq
    arr = []
    self.each do |el|
      arr << el unless arr.include?(el)
    end

    arr.sort
  end

  def two_sum
    arr = []
    self.each_with_index do |el, idx|
      (idx+1...self.length).each do |id|
        arr << [idx, id] if (self[idx]+self[id]).zero?
      end
    end
    arr
  end

  def my_transpose
    rows = self.length
    cols = self[0].length

    trans_arr = []

    (0...cols).each do |col|
      row_arr = []
      (0...rows).each do |row|
        row_arr << self[row][col]
      end
      trans_arr << row_arr
    end

    trans_arr

  end
end

def stock_picker(arr)
    days = []
    profits = 0
    arr.each_with_index do |el, idx|
      end_day = idx + 1
      next if end_day == arr.length
      (end_day...arr.length).each do |ed|
        if profits < arr[ed] - el
          days = [idx, ed]
          profits = arr[ed] - el
        end
      end
    end
    days
end

class Tower

  attr_reader :stacks

  def initialize(stacks = [[3,2,1], [], []])
    @stacks = stacks
    @victory_stack = [[], stacks[1], []]
  end

  def play
      until(game_over)
          puts "Enter beginning stack, ending stack (x,y)."
          temp = gets.chomp
          st_stack, ed_stack = temp.split(",").map(&:to_i)
          move(st_stack, ed_stack)
      end
      puts "You Win."
  end

  def move(start_stack, end_stack)
    if stacks[start_stack].empty?
      raise "Illegal move."
    elsif !stacks[end_stack].empty? && (stacks[end_stack].last < stacks[start_stack].last)
      raise "Illegal move."
    end
    @stacks[end_stack] << stacks[start_stack].pop
  end

  def game_over?

      stacks == @victory_stack

  end

end
