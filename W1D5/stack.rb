class Stack
  attr_reader :stack

  def initialize
    # create ivar to store stack here!
    @stack = Array.new()
  end

  def push(el)
    # adds an element to the stack
    @stack.unshift
    return el
  end

  def pop
    # removes one element from the stack
    @stack.shift
  end

  def peek
    # returns, but doesn't remove, the top element in the stack
    @stack[0]
  end
end
