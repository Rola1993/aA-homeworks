class Map

  attr_reader :map

  def initialize
    @map = Array.new()
  end

  def set(key, val)
    idx = key_idx(key)
    if idx == -1
      @map << [key, val]
    else
      @map[idx].last = val
    end
  end

  def get(key)
    idx = key_idx(key)
    return nil if idx == -1
    return @map[idx].last
  end

  def delete(key)
    val = get(key)
    @map.delete([key,val])
    return val
  end

  def show
    deep_dup(@map)
  end

  private def key_idx(key)
    keys = []
    @map.each do |pair|
      keys << pair.first
    end
    return keys.index(key) if keys.include?(key)
    return -1
  end

  private def deep_dup(arr)
    #base
    return [arr[0]] if !arr[0].is_a?(Array) && arr.length == 1
    return [deep_dup(arr[0])] if arr[0].is_a?(Array) && arr.length == 1
    #recursive
    deep_dup([arr[0]]) + deep_dup(arr[1..-1])
  end

end
