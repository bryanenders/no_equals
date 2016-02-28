class NoEquals::Stack
  def initialize
    @array = []
  end

  def add(&failure_policy)
    apply(:+, &failure_policy)
  end

  def divide(&failure_policy)
    a, b = pop
    raise if b == 0
    push(a/b)
  rescue
    fail!(&failure_policy)
  end

  def multiply(&failure_policy)
    apply(:*, &failure_policy)
  end

  def push(value)
    value.tap { |x| array << x }
  end

  def result
    array.last
  end

  def subtract(&failure_policy)
    apply(:-, &failure_policy)
  end

private

  attr_reader :array

  def apply(operator, &failure_policy)
    value = pop.reduce(operator)
    push(value)
  rescue
    fail!(&failure_policy)
  end

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
