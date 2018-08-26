class Queue
  attr_reader :queue

  def initialize
    @queue =  Array.new()
  end

  def enqueue(el)
    @queue.push(el)
    return el
  end

  def dequeue
    @queue.shift
  end

  def peek
    @queue[0]
  end

end
