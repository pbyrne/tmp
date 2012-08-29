class ImplicitPasser
  def outer
    puts "start outer"
    inner
    puts "end outer"
    puts
    puts
  end

  def inner
    puts "start inner"
    yielder
    puts "end inner"
  end

  def yielder
    puts "start yielder"
    if block_given?
      puts "a block was given, starting block"
      yield "foo"
      puts "ending block"
    else
      puts "no block was given"
    end
    puts "end yielder"
  end
end

class ExplicitPasser
  def outer &block
    puts "start outer"
    inner &block
    puts "end outer"
    puts
    puts
  end

  def inner &block
    puts "start inner"
    yielder &block
    puts "end inner"
  end

  def yielder &block
    puts "start yielder"
    if block_given?
      puts "a block was given, starting block"
      yield "foo"
      puts "ending block"
    else
      puts "no block was given"
    end
    puts "end yielder"
  end
end

# Does a block get implicitly passed down to child methods?
# If so, this will puts "foo"
puts "ImplicitPasser"
ImplicitPasser.new.outer { |x| puts x }
# Nope, it doesn't

# Turns out it doesn't, you have to keep passing it down the chain
# This one actually *does* print "foo"
puts "ExplicitPasser with block"
ExplicitPasser.new.outer { |x| puts x }

puts "ExplicitPasser without block"
ExplicitPasser.new.outer 
