require 'print_debug'

module PrintDebug
  private

  def q(*args)
    puts args.map{ |e| Paint[e.inspect, :random] }*'  ' unless args.empty?
  end
end
