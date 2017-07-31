"1.) Enhance the XML program to add spaces to show indention structure" println
Builder := Object clone
Builder indent := ""
Builder forward := method(
  writeln(indent, "<", call message name, ">")
  call message arguments foreach(
	arg, 
	indent = indent .. "  "
	content := self doMessage(arg); 
	if(content type == "Sequence", writeln(indent, content))
	indent = indent exclusiveSlice(2))
  writeln(indent, "</", call message name, ">"))
Builder  ul(
	li("Io"), 
	li("Lua"), 
	li("JavaScript"))
"2.) Create a list syntax that uses brackets" println
squareBrackets := method(
  new_list := List clone
  call message arguments foreach(arg,
       new_list append(arg)
       )
  new_list
)
"3.) Enhance the XML program to handle attributes: If the first argument is a map (use the curly brackets syntax), add attributes to the XML program. For example, book({author: 'Tate'}...) would print <book author='Tate'>" println
Builder := Object clone
Builder indent := ""
Builder forward := method(
  writeln(indent, "<", call message name, ">")
  call message arguments foreach(
	arg, 
	indent = indent .. "  "
	content := self doMessage(arg); 
	if(content type == "Sequence", writeln(indent, content))
	indent = indent exclusiveSlice(2))
  writeln(indent, "</", call message name, ">"))
Builder atPutAttr := method(
  self atPut(
  	call argAt(0) .. "=" .. call argAt(1)
  )
)
OperatorTable addAssignOperator(":", "Builder atPutAttr")
# END:range
# START:curlyBrackets
curlyBrackets := method(
  r := Map clone
  call message arguments foreach(arg,
       r doMessage(arg)
       )
  r
)
# END:curlyBrackets
Builder  book({author: 'Tate'})
