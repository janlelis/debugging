require 'debugging'

module Debugging
  private

  def q(*args)
    puts args.map{ |e| Paint[e.inspect, :random] }*'  ' unless args.empty?
  end
end
