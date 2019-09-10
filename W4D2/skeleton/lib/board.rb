
require "byebug"
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { Array.new(0) }
    place_stones
    
  end

  def place_stones
    @cups.each_with_index do |num, i|
      unless i == 6 || i == 13
        (0..3).each do |place|
          @cups[i] << :stone
        end
      end
    end
    # debugger
    
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless (0..13).to_a.include?(start_pos)
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    # debugger
    total = @cups[start_pos]
    @cups[start_pos] = []
    if current_player_name.side
    i = total.length
    j = start_pos
    until i == 0
      @cups[j + 1] << :stone
      j += 1
      i -= 1
    end

    if !current_player_name.side == 1

      #evaluate the current player's side and don't include
      #the score cup. 
      #go back through the 

    


    # @board.next_turn
    # @board.render
  end

  def [](index)
    @cups[index]
  end

  def []=(index, value)
    @cups[index] = value
  end




  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
