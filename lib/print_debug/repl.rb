require 'print_debug'
require 'binding.repl'

begin
  require 'binding_of_caller'
rescue LoadError
end

module PrintDebug
  private

  def repl
    if defined?(BindingOfCaller)
      binding.of_caller(1).repl.auto
    else
      raise ArgumentError, 'Using Inspection#repl requires the "binding_of_caller" gem. Please install it or add it to your Gemfile!'
    end
  end
end