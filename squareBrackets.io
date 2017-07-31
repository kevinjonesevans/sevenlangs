squareBrackets := method(
  new_list := List clone
  call message arguments foreach(arg,
       new_list append(arg)
       )
  new_list
)
[1,2,3] println