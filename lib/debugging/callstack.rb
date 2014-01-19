require 'debugging'

module Debugging
  private

  def callstack
    caller.reverse.map{ |m|
      m.rindex( /:\d+(:in `(.*)')?$/ )
      $2
    }.compact.each.with_index{ |m, i|
      puts "  "*i + m
    }

    nil
  end
end
