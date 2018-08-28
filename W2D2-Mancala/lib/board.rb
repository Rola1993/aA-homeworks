class Board
  attr_accessor :cups, :name1, :name2, :cur_cup

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cur_cup = 6
    @cups = Array.new(14)
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    (0..5).each do |i|
      @cups[i] = [:stone, :stone, :stone, :stone]
    end
    (7..12).each do |i|
      @cups[i] = [:stone, :stone, :stone, :stone]
    end
    @cups[6] = []
    @cups[13] = []
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos >= 14
    raise "Starting cup is empty" if @cups[start_pos].length == 0

  end

  def make_move(start_pos, current_player_name)
    i = 1
    if current_player_name == name1
      oppo_cup = 13
      @cur_cup = 6
    else
      oppo_cup = 6
      @cur_cup = 13
    end

    while @cups[start_pos].length != 0
      @cups[start_pos + i] << @cups[start_pos].pop if start_pos + i != oppo_cup
      i += 1
      i = 0 if start_pos + i > 13
    end

    render

    next_turn(start_pos + i - 1)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    return :switch if @cups[ending_cup_idx].length == 0
    return :prompt if ending_cup_idx == @cur_cup
    return ending_cup_idx if @cups[ending_cup_idx].length > 1
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[0..5].all? {|cup| cup.length == 0}
    return true if @cups[7..12].all? {|cup| cup.length == 0}
    false
  end

  def winner
    return @name1 if @cups[6].count > @cups[13].count
    return @name2 if @cups[6].count < @cups[13].count
    return :draw if @cups[6].count  == @cups[13].count
  end
end
