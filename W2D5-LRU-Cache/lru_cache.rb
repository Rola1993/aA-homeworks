class LRUCache
  attr_accessor :cache, :size, :order_set

  def initialize(size)
    @cache = []
    @size = size
    @order_set = []
  end

  def count
    # returns number of elements currently in cache
    @cache.length
  end

  def add(el)
    # adds element to cache according to LRU principle
    if count >= @size
      reorder(el)
      @cache = order_set.take(size)
    else
      @order_set << el
      @cache << el
    end

  end

  def show
    # shows the items in the cache, with the LRU item first
    @cache
  end

  private
  # helper methods go here!

  def reorder(el)
    if @order_set.include?(el)
      @order_set.delete(el)
      @order_set << el
    else
      @order_set << el
      @order_set.shift
    end
  end

end
