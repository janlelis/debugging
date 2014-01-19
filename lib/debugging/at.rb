require 'debugging'

module Debugging
  private

  def at(label = nil)
    caller[0].rindex( /:(\d+)(:in (`.*'))?$/ )
    puts "#{ label && Paint["#{label} ", :yellow] }@"\
         " #{ $3 && "method #{ Paint[$3, :red] }, " }line "\
         "#{ Paint[$1, :blue]} of file #{ Paint[$`, :green]}"
  end
end
