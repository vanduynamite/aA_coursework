require 'byebug'

def does_this_work(num)

  debugger

  # multiply by 8
  num *= 7

  num

end

# in the debugger, type 'display num' for it to display that variable
# every time the code stops

# n or next to go to the next step
# s or step to step into something. equivalent to next if there's no extra method OR BLOCK being called
# f or finish to step OUT of a method
# c or continue to just keep going
# exit to leave the debugger

# wtf, wtf?, wtf!!?! to get a stack trace
