require 'print_debug'

module PrintDebug
  private

  def q(*args)
    puts args.map( &:inspect )*'  ' unless args.empty?
  end
end
