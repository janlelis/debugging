require 'print_debug'

module PrintDebug
  private

  def regex(r, string, groups = nil)
    if r =~ string
      if !groups
        puts $` + ' >' + $& + '< ' + $'
      else
        Array( groups ).each{ |group|
          begin
            gr_string = string.dup
            gr_string[ $~.end( group ),   0 ] = '< '
            gr_string[ $~.begin( group ), 0 ] = ' >'
            puts group.to_s + ': ' + gr_string
          rescue IndexError, defined?(Rubinius) && Rubinius::ObjectBoundsExceededError
            puts group.to_s + ': no match'
          end
        }
      end
    else
      puts 'no match'
    end

    nil
  end
end
