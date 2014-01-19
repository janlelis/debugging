require 'print_debug'

module PrintDebug
  private

  def callstack
    method_stack = caller.reverse.map{ |m|
      m.rindex( /:\d+(:in `(.*)')?$/ )
      $2
    }.compact

    method_stack.each.with_index{ |m, i|
      puts "  "*i + m
    }

    nil
  end
end
