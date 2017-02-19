Object ancestors := method(
	prototype := self proto
	if(self != Object,
		writeln("Slots of ", prototype type, "\n -----------")
		prototype slotNames foreach(slotName, writeln(slotName))
		writeln
		prototype ancestors
	)
)

Animal := Object clone
Duck := Animal clone
Duck waddle := method("Waddle" println)
disco := Duck clone
disco ancestors