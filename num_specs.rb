#def tail_scanner
spec_examples_array = %x( rspec | tail -1 ).scan(/\d+/)
#end
saved_current_time = Time.now

