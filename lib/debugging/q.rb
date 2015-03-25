require 'debugging'

module Debugging
  private

  def q(*args)
    puts args.map{ |e| Paint[e.inspect, Paint.random] }*'  ' unless args.empty?
  end
end
