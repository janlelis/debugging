require 'print_debug'

module PrintDebug
  private

  def beep
    $stdout.print "\a"
  end
end