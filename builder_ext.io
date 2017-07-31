Builder := Object clone
Builder indent := ""
outputAttr := method(
    write(call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\"") .. "=" .. call evalArgAt(1))
)
OperatorTable addAssignOperator(":", "outputAttr")
curlyBrackets := method(
  call message arguments map(arg, Builder doMessage(arg)) join("")
)
Builder forward := method(
  args := call message arguments
  attributes := ''
  if(args size > 0 and args at(0) name == "curlyBrackets", "HERE" println)
  # if(args size > 0 and args at(0) name == "curlyBrackets", attributes=doMessage(args removeFirst))
  writeln(indent, "<", call message name, attributes, ">")
  call message arguments foreach(
	arg, 
	indent = indent .. "  "
	content := self doMessage(arg); 
  if(content type == "Sequence", writeln(indent, content))
	indent = indent exclusiveSlice(2))
  writeln(indent, "</", call message name, ">"))

Builder  book({author: 'Tate'})