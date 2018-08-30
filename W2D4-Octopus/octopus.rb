# Find the longest fish in O(n^2) time.
def sluggish_octopus(fishes)
  max_fish = fishes[0]
  (0...fishes.length).each do |i|
    (i+1...fishes.length).each do |j|
      if fishes[i].length > fishes[j].length
        max_fish = fishes[i]
      else
        max_fish = fishes[j]
      end
    end
  end
  return max_fish
end

class Array

  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if count <= 1

    mid = count / 2
    sorted_left = self.take(mid).merge_sort(&prc)
    sorted_right = self.drop(mid).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end
end

def dominant_octopus(fishes)
  prc = Proc.new { |x, y| x.length <=>y.length }
  fishes.merge_sort(&prc).last
end

def clever_octopus(fishes)
  max_fish = fishes[0]
  (1...fishes.length).each do |fish|
    max_fish = fish if fish.length > max_fish.length
  end
  max_fish
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, tiles_array)
  tiles_array.index(direction)
end

tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end
