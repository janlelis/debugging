require 'debugging'

module Debugging
  private

  def re(string, regex, groups = nil)
    if regex =~ string
      if !groups
        puts $` + Paint[$&, :green] + $'
      else
        Array( groups ).each{ |group_nr|
          begin
            raise IndexError unless $~[group_nr]
            gr_string = string.dup
            gr_string[ $~.end( group_nr ),   0 ] = Paint::NOTHING
            gr_string[ $~.begin( group_nr ), 0 ] = Paint.color(:green)
            puts group_nr.to_s + ': ' + gr_string
          rescue IndexError
            puts group_nr.to_s + ': ' + Paint['no match', :red]
          end
        }
      end
    else
      puts Paint['no match', :red]
    end

    nil
  end
end
