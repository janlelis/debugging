require 'print_debug'

module PrintDebug
  private

  def at(label = nil)
    caller[0].rindex( /:(\d+)(:in (`.*'))?$/ )
    puts "#{ label && "#{label} " }@ #{ $3 && "method #$3, " }line #$1 of file #$`"
  end
end
