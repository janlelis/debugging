require 'debugging'

module Debugging
  private

  def beep
    $stdout.print "\a"
  end
end