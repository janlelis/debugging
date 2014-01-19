require 'debugging'
require 'binding.repl'

begin
  require 'binding_of_caller'
rescue LoadError
  warn 'Using Debugging#repl requires the "binding_of_caller" gem. Please install it or add it to your Gemfile!'
end

module Debugging
  private

  def repl
    binding.of_caller(1).repl.auto
  end
end