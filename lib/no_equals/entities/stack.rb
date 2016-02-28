class NoEquals::Stack
  def initialize
    @array = []
  end

  def add(&failure_policy)
    sum = pop.reduce(:+)
    push(sum)
  rescue
    fail!(&failure_policy)
  end

  def push(value)
    value.tap { |x| array << x }
  end

  def result
    array.last
  end

private

  attr_reader :array

  def fail!
    initialize
    if block_given?
      yield NoEquals::UndefinedBehavior
    else
      raise NoEquals::UndefinedBehavior
    end
  end

  def pop
    raise if array.length < 2
    array.pop(2)
  end
end

NoEquals::UndefinedBehavior = Class.new(StandardError)
